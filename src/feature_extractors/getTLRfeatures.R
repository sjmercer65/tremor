#
# Adapted from code written by:
# Abhishek Pratap (apratap@sagebase.org)
# Elias Chaibub Neto (elias.chaibub.neto@sagebase.org)
#

library(synapseClient)
# set up config file in home directory to run without credentials:
synapseLogin()

# hardcoded instead of command-line
currentDirectory = '/Users/sjm/Git/DS/Week10/tdata'
parentId = 'output_features'

library(plyr)
library(dplyr)
library(ggplot2)
library(doMC)
library(jsonlite)
library(parallel)
library(tidyr)
library("lubridate")
library("stringr")
library("mpowertools")
source(paste(currentDirectory, "/featureExtraction/utils.R", sep=""))

INPUT_TREMOR_TABLE_SYNID = 'syn8444013'
PREVIOUS_TREMOR_FEATURES = ""
actv_tremor_syntable <- synTableQuery(paste0('SELECT * FROM ', INPUT_TREMOR_TABLE_SYNID))
actv_tremor <- actv_tremor_syntable@values
actv_tremor$idx <- rownames(actv_tremor)

#saving for later
selected_records <- actv_tremor$recordId


######################
# Download JSON Files
######################

lap_right <- synDownloadTableColumns(actv_tremor_syntable, "deviceMotion_tremor_handInLap_right.json.items")
lap_right <- data.frame(deviceMotion_tremor_handInLap_right.json.items=names(lap_right), lap_right_file=as.character(lap_right))
actv_tremor <- merge(actv_tremor, lap_right, by="deviceMotion_tremor_handInLap_right.json.items", all=T)


# store in more convenient format (character, rather than json string)
extractJson <- function(j) {
	return(tryCatch(jsonlite::fromJSON(j), error=function(err) "NA"))
}
actv_tremor$medicationTime <- unlist(lapply(actv_tremor$medicationActivityTiming.json.choiceAnswers, extractJson))
actv_tremor$momentInDay <- unlist(lapply(actv_tremor$momentInDayFormat.json.choiceAnswers, extractJson))


#############
# Feature Extraction
##############
if (detectCores() >= 2) {
    runParallel <- TRUE
} else {
    runParallel <- FALSE
}
registerDoMC(detectCores())

#extract handInLap.right features
lapRightFeatures <- ddply(.data=actv_tremor, .variables=colnames(actv_tremor), .parallel=runParallel,
                         .fun = function(row) { tryCatch({mpowertools::getWalkFeatures(as.character(row$lap_right_file))},
                                                 error = function(err){
                                                 print(paste0('Unable to process ', row$lap_right_file))
                                                 print(err) })
                                                })


#only keep the non-redundant data
lapRightFeatures <- lapRightFeatures %>% filter(recordId %in% selected_records)


#############
# Final Data
#############
OUTPUT_FOLDER_ID <- parentId
OUTPUT_FILE <- paste(currentDirectory, "/featureExtraction/TremorLapRightFeatures.tsv", sep="")
write.table(lapRightFeatures, OUTPUT_FILE, sep="\t", row.names=F, quote=F, na="")
