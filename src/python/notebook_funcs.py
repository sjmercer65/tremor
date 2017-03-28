'''
notebook_funcs.py

Helper functions for Jupyter notebook <Parkinsons.ipynb>

All functions by Simon Mercer (simonm@imail.com)
Unless otherwise acknowledged in the function header
'''

import numpy as np
import pandas as pd
import seaborn as sns
import sqlalchemy
from matplotlib import pyplot as plt
from mlxtend.feature_selection import SequentialFeatureSelector as SFS
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
from sklearn.metrics import roc_auc_score
from sklearn.metrics import roc_curve
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import binarize
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import make_pipeline


def connect(db, host='localhost', port=5432):
    '''
    Connects to PostgreSQL database

    Input:
     db - local postgresql database name
     host - machine hosting postgresql instance
     port - communication port for postgresql instance
    Output:
     postgresql connection object

    PostgreSQL URL format (user/pass not needed locally):
    postgresql://user:password@localhost:5432/tremor
    '''
    url = 'postgresql://{}:{}/{}'
    url = url.format(host, port, db)
    return sqlalchemy.create_engine(url, client_encoding='utf8')


def add_features(df):
    '''
    Add derived/dummy features to the data frame

    Input:
      data frame containing a gesture feature set
    Output:
      none - data frame is modified in place

    NOTE - Unlike the other functions, this one has large sections
    commented out as the result of experimentation with combinations
    of parameters. I will leave these in place so users may tweak
    the available feature set if desired.
    '''
    '''
    # add dummy columns for demographic categories
    df = pd.concat([df, pd.get_dummies(df['gender'])], axis=1)
    df = pd.concat([df, pd.get_dummies(df['medicationtime'])], axis=1)
    df = pd.concat([df, pd.get_dummies(df['smartphone'])], axis=1)
    '''

    # drop columns we used to make the dummies
    df.drop('gender', axis=1, inplace=True)
    df.drop('medicationtime', axis=1, inplace=True)
    df.drop('smartphone', axis=1, inplace=True)

    # to remove all demographic data, drop these too
    #df.drop('age', axis=1, inplace=True)
    df.drop('years_smoking', axis=1, inplace=True)

    '''
    # drop one dummy column for the single subject with gender=unknown.
    # we cant use it for prediction, becase 100% of 'unknowns' are
    # in the same category...
    df.drop('Unknown', axis=1, inplace=True)

    # drop medicationtime dummies related to NOT being medicated
    df.drop('No Tracked Medication', axis=1, inplace=True)
    df.drop('NA', axis=1, inplace=True)
    '''
    return df


def get_datasets(db_connection):
    '''
    Build one data frame for each gesture

    Input:
      database connection
    Output:
      list of data frame objects, one per gesture

    '''
    df_tll = add_features(pd.read_sql('SELECT * FROM tll_final', db_connection))
    df_tlr = add_features(pd.read_sql('SELECT * FROM tlr_final', db_connection))
    df_tnl = add_features(pd.read_sql('SELECT * FROM tnl_final', db_connection))
    df_tnr = add_features(pd.read_sql('SELECT * FROM tnr_final', db_connection))
    df_tsl = add_features(pd.read_sql('SELECT * FROM tsl_final', db_connection))
    df_tsr = add_features(pd.read_sql('SELECT * FROM tsr_final', db_connection))
    return [df_tll, df_tlr, df_tnl, df_tnr, df_tsl, df_tsr]


def create_predictor_set(df, fields=''):
    '''
    Creates a set of predictors (x values) and a set of labels (y values)

    Input:
      df - data frame
      fields - (optional) field mask restricting the data frame (default = all)
    Output:
      tuple of data frames of X vector and y labels
    '''

    y_all = df['datagroups']
    X_all = df.drop('datagroups', axis=1, inplace=False)

    if fields:
        X_all = X_all[fields]
    return X_all, y_all


def sff_selection(k_features, pipeline, x, y, fwd=True, flt=True):
    '''
    Selects a subset of available features

    Input:
      k_features - number of features to select
      pipeline - predictor pipeline
      x, y - features and labels
      fwd,flt - boolean parameters for SFFS algorithm, see mlxtend docs
    Output:
      tuple of accuracy score and list of k selected fatures

    The mlxtend SFS function implements four related feature selection algorithms;
    if the default parameters (fwd=True, flt=True) are not changed, this is
    Sequential Floating Forward Selection (SFFS)

    SFFS has been identified as a good way of performing dimension reduction
    through feature selection on triaxial accelerometer data:

      Gupta and Tim Dallas (2014) "Feature Selection and Activity Recognition
      System Using a Single Triaxial Accelerometer"
      IEEE Trans. Bomed. Eng., 61(6)

    '''
    # hyperparameters
    sffs_scoring = 'accuracy'
    sffs_cv_folds = 10

    # Feature selection
    sffs = SFS(pipeline,
           k_features=k_features,
           forward=fwd,
           floating=flt,
           scoring=sffs_scoring,
           cv=sffs_cv_folds,
           n_jobs=-1)

    sffs = sffs.fit(x.as_matrix(), y.as_matrix())

    # list of the k best features
    feat_names = list(x.columns.values)
    feat_list = [feat_names[i] for i in sffs.k_feature_idx_]

    # return the prediction score and feature name list
    return sffs.k_score_, feat_list


def search_features(lr_pipeline, x, y, n):
    '''
    WARNING - RUNS SLOWLY
    Explore the parameter space from 1 to n features
    WARNING - RUNS SLOWLY

    Input:
      lr_pipeline - predictor pipeline
      x, y - features and labels
      n - maximum number of features to Explore
    Output:
      lists of number of features and accuracy scores
    '''
    # initialize x and y lists with zeros so we have a point at the origin
    x_list = [0]
    y_list = [0]
    for k in range(1, n+1):
        sffs_score, feat_list = sff_selection(k, lr_pipeline, x, y, fwd=True, flt=True)
        x_list.append(k)
        y_list.append(sffs_score)
        print "k={}, accuracy={}, features({})".format(k, sffs_score, ','.join(feat_list))
    return x_list, y_list


def find_idx(mylist, threshold):
    '''
    Returns the index of the last element in mylist where
    mylist[i+1] is less than threshold bigger than mylist[i]

    Input:
        mylist = list of numbers
        threshold = number
    Output:
        integer
    '''
    for i in range(len(mylist)-1):
        if (mylist[i] + threshold) > mylist[i+1]:
            return i
    return len(mylist) -1


def sffs_plot(x_list, y_list):
    '''
    Plot how cross-validation score varies with the number of
    features used in prediction

    Input:
      x_list - integer list of number of features
      y_list - float list of prediction accuracies
    Output:
      none (graph displayed in notebook)
    '''
    plt.plot(x_list, y_list, c='blue', alpha=0.5)
    plt.xlabel("Number of features")
    plt.ylabel("Cross-validation score")
    plt.title("Optimal feature selection using SFFS")
    # x will be 0-9
    plt.xlim([0.0, 9.5])
    plt.ylim([0.0, 1.0])
    plt.show()


def roc_on(fpr, tpr, roc_auc, g_name):
    '''
    Plots a Receiver Operator Characteristic (ROC) curve

    Input:
      fpr - list of false positive rates
      tpr - list of true positive rates
      roc_auc - area under the curve
      g_name - gesture name for title
    Output:
      none (graph displayed in notebook)
    '''
    # display the ROC curve
    sns.set_style("darkgrid")
    plt.plot(fpr, tpr, color='darkorange', label='Area under curve = {}'.format('%.3f' % roc_auc))
    plt.plot([0, 1], [0, 1], color='blue', lw=1, linestyle='--')
    plt.xlabel("False Positive Rate (1 - Specificity)")
    plt.ylabel("True Positive Rate (Sensitivity, Recall)")
    plt.title("ROC curve for gesture {}".format(g_name))
    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.legend(loc="lower right")
    plt.show()


def build_cfm(roc_prob, y_test):
    '''
    Creates data for display in a Confusion matrix

    Input:
      roc_prob - list of probabilities (floats) for each label
      y_test - list of labels (binary)
    Output:
      none (passes to show_confusion_matrix, which displays in notebook)

    Threshold in the binarize function can be adjusted to change
    classifications; experimentation shows reducing threshold decreases
    FN rate but increases FP rate - we can accept FP but not FN,
    so threshold is low
    '''
    X_binary = binarize(roc_prob.reshape(-1, 1), threshold=0.25)
    C = confusion_matrix(y_test, X_binary)
    show_confusion_matrix(C, ['Control', 'Parkinsons'])


def show_confusion_matrix(C, class_labels=['0', '1']):
    """
    C: ndarray, shape (2,2) as given by scikit-learn confusion_matrix function
    class_labels: list of strings, default simply labels 0 and 1.

    Draws confusion matrix with associated metrics.

    Original code by Matt Hancock:
    http://notmatthancock.github.io/2015/10/28/confusion-matrix.html

    """
    import matplotlib.pyplot as plt
    import numpy as np

    assert C.shape == (2, 2), "Confusion matrix should be from binary classification only."

    # true negative, false positive, etc...
    tn = C[0, 0]
    fp = C[0, 1]
    fn = C[1, 0]
    tp = C[1, 1]

    NP = fn + tp  # Num positive examples
    NN = tn + fp  # Num negative examples
    N = NP + NN

    fig = plt.figure(figsize=(8, 8))
    ax = fig.add_subplot(111)
    ax.imshow(C, interpolation='nearest', cmap=plt.cm.gray)

    # Draw the grid boxes
    ax.set_xlim(-0.5, 2.5)
    ax.set_ylim(2.5, -0.5)
    ax.plot([-0.5, 2.5], [0.5, 0.5], '-k', lw=2)
    ax.plot([-0.5, 2.5], [1.5, 1.5], '-k', lw=2)
    ax.plot([0.5, 0.5], [-0.5, 2.5], '-k', lw=2)
    ax.plot([1.5, 1.5], [-0.5, 2.5], '-k', lw=2)

    # Set xlabels
    ax.set_xlabel('Predicted Label', fontsize=16)
    ax.set_xticks([0, 1, 2])
    ax.set_xticklabels(class_labels + [''])
    ax.xaxis.set_label_position('top')
    ax.xaxis.tick_top()
    # These coordinate might require some tinkering. Ditto for y, below.
    ax.xaxis.set_label_coords(0.34, 1.06)

    # Set ylabels
    ax.set_ylabel('True Label', fontsize=16, rotation=90)
    ax.set_yticklabels(class_labels + [''], rotation=90)
    ax.set_yticks([0, 1, 2])
    ax.yaxis.set_label_coords(-0.09, 0.65)

    # Fill in initial metrics: tp, tn, etc...
    ax.text(0, 0,
            'True Neg: %d\n(Num Neg: %d)' % (tn, NN),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(0, 1,
            'False Neg: %d' % fn,
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(1, 0,
            'False Pos: %d' % fp,
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(1, 1,
            'True Pos: %d\n(Num Pos: %d)' % (tp, NP),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    # Fill in secondary metrics: accuracy, true pos rate, etc...
    ax.text(2, 0,
            'False Pos Rate: %.2f' % (fp / (fp+tn+0.)),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(2, 1,
            'True Pos Rate: %.2f' % (tp / (tp+fn+0.)),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(2, 2,
            'Accuracy: %.2f' % ((tp+tn+0.)/N),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(0, 2,
            'Neg Pre Val: %.2f' % (1-fn/(fn+tn+0.)),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    ax.text(1, 2,
            'Pos Pred Val: %.2f' % (tp/(tp+fp+0.)),
            va='center',
            ha='center',
            bbox=dict(fc='w', boxstyle='round,pad=1'))

    plt.tight_layout()
    plt.show()
