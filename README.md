# Coursera_TidyData

This project provids an R script `run_analysis.R` which loads and processes data from the 
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to create a tidy extract of this data set.

## Requirements

The following R libraries will be used throughout script execution and have to be installed beforehand:

* `dplyr` ([Package on cran](http://cran.r-project.org/web/packages/dplyr/index.html))
* `stringr` ([Package on cran](http://cran.r-project.org/web/packages/stringr/index.html))

Furthermore, the user executing the script needs to have _write_ permissions in the working directory. 
The data set will require roughly 300MB of space on the disk and will be stored in the working directory if not already present.

## Script Execution

The script can be executed without any configuration or command line parameter. 

    source('run_analysis.R')
    
If the data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones is already locally available, a re-download can be omitted if the original zip archive is extracted into the working directory.     

## Output Data

The result is a single file `tidyDF.txt` representing a _tidy_ data set in the sense of [Hadley Wickham's Tidy Data Article](http://www.jstatsoft.org/v59/i10/):

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table. -- _Well, there is only this single file, but anyway..._

For a more detailed description of the contents of the result file and the processing steps involved to create this file please refer to the [Codebook](Codebook.md)