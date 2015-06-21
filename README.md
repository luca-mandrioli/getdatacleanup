Getting and Cleaning Data - getdata-015 (coursera course)
==========================================
## Requirements
- all source data needs to be unzipped in the same folder as the script get launched (i.e. the path should be valid ./UCI\ HAR\ Dataset/)
- reshape2 package is installed (i.e. install.packages("reshape2")

## Files committed
The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

- 'codebook.md': cookbook to describe data and variables handled by the run_analys
- run_analysis.R: script that loads and cleans up data

## How to run_analysis.R
- source("./run_analysis.R")
- then run through RStudio for example

## Resources
Source data: 
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Download the data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
