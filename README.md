# Using Accelerometer Data to Detect Parkinson’s Disease: A Preliminary Study

### Simon Mercer - Galvanize Data Science Student, March 2017

## Business Understanding
Parkinson’s Disease is a progressive neurological disorder affecting at least one million Americans, with 60,000 new cases diagnosed in the US every year - and there are strong reasons to believe that the majority of Parkinson’s sufferers go undiagnosed. Nonetheless even at the current rate of diagnosis, Parkinson’s Disease is estimated to cost the US economy over 25 billion dollars annually. While Parkinson’s is not considered a terminal disease, it is incurable and progressive and so the identification of the most effective therapies for each patient would have an immediate effect on quality of life.

Parkinson’s disease is characterized by three principal symptoms - Bradykinesia or slowness of movement, rigidity of the body evident in many ways including reduction in facial expression, and resting tremor. Tremor is present in about 75% of patients and is often the first symptom leading to diagnosis, but it is significant in a number of other ways; the tremor-dominant Parkinson’s subtype is a milder disorder than the non-tremor subtype and many other minor differences between subtypes have been noted; also in cases where symptoms occur predominantly on one side of the body, tremor is sometimes found on the opposite side to the other symptoms.

The focus of this project will be a detailed characterization of patient tremor through the extraction of a standard feature set, and an exploration of the extent to which tremor characteristics are related to, and predictive of, a diagnosis of Parkinson’s Disease. Further aims are to determine the extent to which a smartphone accelerometer is an effective tool for the collection of tremor data.

# Acknowledgements:
<ul>
<li>I have been assisted in my understanding of the data by copious documentation available through the Synapse mPower Portal, as well as through the kind assistance of Dr. Larsson Omberg, Chief Data Scientist at Sage Bionetworks.
<li>I am also grateful to Dr. A. Wong, General Neurologist and Dr. J. Witt, head of the Movement Disorders clinic at Swedish Neurology Institute for their assistance in better understanding the clinical aspects of Parkinson’s Disease.
</ul>

Sections of the code used in this project are the work of others and are acknowledged in their respective files - they are:
Standardized feature extraction code written in R (under /src/feature_extractors) is edited from an original script written by Abhishek Pratap and Elias Chaibub Neto of Sage Bionetworks.
The Python code for display of an enhanced Confusion Matrix was written by Matt Hancock (http://notmatthancock.github.io/2015/10/28/confusion-matrix.html).

# References:
Parkinson’s Disease Foundation: Parkinson’s Statistics http://www.pdf.org/en/parkinson_statistics
Cerebral causes and consequences of Parkinsonian resting tremor: a tale of two circuits? https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3501966/
Parkinson's disease tremor: pathophysiology https://www.ncbi.nlm.nih.gov/pubmed/22166464


## Data Understanding
In March 2015, Apple launched ResearchKit, a toolkit for the rapid construction of research-oriented mobile applications, and local Seattle non-profit Sage Bionetworks (http://sagebase.org/) used this technology to create a range of applications intended to further healthcare research through the widespread collection of healthcare data. One of the first was the Parkinson’s Study M-Power App (https://itunes.apple.com/us/app/parkinson-mpower-study-app/id972191200?mt=8) which tracks the health of patients through questionnaires and the collection of data using phone sensors and an optional wearable device.

These datasets are confidential medical data and are available for authorized research purposes only via the Synapse data portal (https://www.synapse.org/), with copious metadata and documentation available to registered users. Currently, three patient surveys are generally available along with four Activities - a set of Activity data comprises the output of a range of phone sensors while the patient conducts a specified set of tasks.

The data collected to evaluate tremor are not a part of the currently released datasets and I am the only authorized user and my Statement of Use is included in the list of authorized projects here (https://www.synapse.org/#!Synapse:syn4993293/wiki/392026); while I may share summarized data and results as a part of my project, I am not able to share underlying dataset. There are many references to the structure of the data in the source files especially with regard to data cleaning (see /src/postgres).


## Preparation
In the case of resting tremor, the data have not yet been cleaned and documented for public release, but consist of 19,000 users (approximately 1200 with a diagnosis of Parkinson’s Disease, the rest controls) performing a set of six movements corresponding to a standard clinical tremor test, with the phone accelerometer sampling tremor at 100 Hz (tremor is typically in the 3-5 Hz range). Approximately 500,000 tests have been recorded, with approximately 18,500 related to tremor.

For feature extraction, I was able to rely on the mPower Tools toolkit (https://github.com/Sage-Bionetworks/mpowertools), a series of R scripts for the extraction of about 100 generic features from accelerometer data. These utilities perform a compute-intensive analysis, generating tab-delimited output, which must pre pre-processed to strip headers of illegal characters, trim spurious fields and determine field data types before being loaded into a local PostgreSQL 9.6.1 database. Data cleaning is then accomplished through a sequence of SQL files, the final phase of which creates one table of combined demographic and accelerometer feature data for each of the six gestures recorded, each table.

Unfortunately due to duplicated data and missing values, a total of 220 subjects remain in the cleaned dataset, 114 with a confirmed professional diagnosis of Parkinson’s Disease and 106 identified as Controls.

One potential deliverable from this stage is sufficient information about the data to generate a page similar to that available for the walking Activity: https://www.synapse.org/#!Synapse:syn4993293/wiki/376006 (requires login).


## Modeling
The intent to classify patients using tremor characteristics requires the choice of a model which can clearly convey the contribution each factor makes to the final prediction so the statistical classification can be justified with reference to clinical observation. My initial approach is therefore logistic regression.

The data are read into Python 2.7/Pandas 0.19.2 data frames where Parkinson/Control labels were binarized and other categorical fields separated into binary dummy columns in readiness for regularized linear regression and creating an entirely numeric feature set. Feature values were then standardized before being fitted to a logistic regression model containing a lasso regularization term.

Initial regressions using the entire dataset had an accuracy of about 0.6 - and with a null error rate of 0.52, this was little better than a guess; further investigations showed that the exclusion of potentially confounding demographic fields (whether a patient required home care, for instance, is too strongly associated with having Parkinson’s) and a sole reliance on accelerometer data boosted accuracy to around 0.75 - but the predictive vector of accelerometer features were hard to interpret.

In order to reduce dimensions and identify the best accelerometer features to use, we chose the Sequential Floating Forward Search algorithm (a summary of this algorithm is provided on slide 17 of this presentation: http://research.cs.tamu.edu/prism/lectures/pr/pr_l11.pdf) which has been identified by Gupta and Dallas (2014) as especially valuable when applied to 3-axis accelerometer features. This identified vectors of 2-5 accelerometer features specific to each gesture, which when combined with the most predictive demographic feature (age) produces accuracies in the range 0.82 - 0.89.

To investigate if accuracy could be further improved by combining models, I created all possible pairwise combinations of gestures and evaluated each model using 10-fold cross-validation at a range of steadily increasing regularization levels. In all cases, predictive accuracy declined slightly (reducing bias in the model) as regularization increased, but no combined model provided the accuracy of the best single-gesture models. The preferred approach going forward would be to average accuracies between all six gesture models, substantially reducing variance while retaining high accuracy.

# Reference:
Gupta, P and Dallas, T., (2014) “Feature Selection and Activity Recognition System Using a Single Triaxial Accelerometer”, IEEE Trans. Biomed. Eng. (61):6.


## Evaluation
Regressions were subject to 10-fold cross-validation, and sample ROC curves and Confusion Matrices were generated for each gesture to further characterize the fitted model. As the confusion matrices indicate, any model that claims to diagnose a serious disease may tolerate a low level of false positive results but should not generate false negatives. In consequence, the threshold of the Logistic regression was adjusted to 0.25 - but no threshold completely eliminated false negative classifications.


## Deployment
Availability of the mPower data is restricted and so the underlying dataset cannot be shared, and it would not be advisable to make any public release of a predictive tool based on two weeks work of a data science student, so public deployment is not a goal - however these initial results are promising, and deserve further investigation.


## Future Work
Even this preliminary analysis has demonstrated that accelerometer data processed into a set of generic (not task-specific) features can be used to accurately predict Parkinson’s Disease, but the dataset would also support longitudinal studies of the progression of tremor, and predictive accuracy is highly likely to be enhanced through the derivation of features more related to variations in tremor during specific gesture tasks. Additional analyses that might yield improvements include feature learning from raw accelerometer traces using convolutional neural networks (followed by an effort to relate learned features to clinical features using medical expertise), or a decision tree approach to improve predictive accuracy at the expense of feature understandability.
