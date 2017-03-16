#
# Adapted from code written by:
# Abhishek Pratap (apratap@sagebase.org)
# Elias Chaibub Neto (elias.chaibub.neto@sagebase.org)
#

library(synapseClient)
# If you have your config file set up you can run:
synapseLogin()

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

lap_left <- synDownloadTableColumns(actv_tremor_syntable, "deviceMotion_tremor_handInLap_left.json.items")
lap_left <- data.frame(deviceMotion_tremor_handInLap_left.json.items=names(lap_left), lap_left_file=as.character(lap_left))
actv_tremor <- merge(actv_tremor, lap_left, by="deviceMotion_tremor_handInLap_left.json.items", all=T)


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

lapLeftFeatures <- ddply(.data=actv_tremor, .variables=colnames(actv_tremor), .parallel=runParallel,
                         .fun = function(row) { tryCatch({mpowertools::getWalkFeatures(as.character(row$lap_left_file))},
                                                 error = function(err){
                                                 print(paste0('Unable to process ', row$lap_left_file))
                                                 print(err) })
                                                })

#only keep the non-redundant data
lapLeftFeatures <- lapLeftFeatures %>% filter(recordId %in% selected_records)


#############
# Final Data
#############
OUTPUT_FOLDER_ID <- parentId

OUTPUT_FILE <- paste(currentDirectory, "/featureExtraction/TremorLapLeftFeatures.tsv", sep="")
write.table(lapLeftFeatures, OUTPUT_FILE, sep="\t", row.names=F, quote=F, na="")
