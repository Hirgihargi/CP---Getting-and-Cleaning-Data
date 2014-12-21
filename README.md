
##ReadMe: CP---Getting-and-Cleaning-Data

<br>

#####What does the *run_analysis.R* script do?

The script takes data from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) as input. The data originates from a study conducted by J. L. Reyes-Ortiz et al [1]. The thirty participants were carrying smartphones that measured inertial forces, while the subjects were executing different activities. (More information can be found on the website and in the *README.txt* file of the data set.)

The *run_analysis.R* script adds the data together to one data set and extracts only the variables that calculate the average or the standard deviation of measurements. The means of these values for each subject/activity combination are calculated and displayed in a tidy data set.

* First of all the library `dplyr` is loaded into R for later usage of its functions `mutate()`, `group_by()` and `summarise_each()`.

* For each the training set and the test set the different files that contain the important data (the directory *Inertial Signals* is not included) are combined in one data set (*alltrain* and *alltest* respectively) with `cbind()`. The *subject* files present via a subject ID from who of the 30 study participants the measurements are. The *y* files contain the data about the activity the subject was performing (as numbers from 1 to 6). The *X* files comprise of 561 features that describe the measurements from the smartphones. They are all normalized to a range between -1 and 1.

* After joining the individual data of the training and the test sets the two resulting data frames are combined to one (*alldata*) with the function `rbind()`.

* The columns are labeled with the variable names. For the features the names from the *feature.txt* file are used. The names *subject* and *activity* are assigned to the subject and the activity columns.

* Those features that calculate the average or the standard deviation are extracted, together with the first two columns *subject* and *activity*. The columns whose names contain *mean()* or *std()* are chosen. The `grep()` function searches the pattern `"mean\\(\\)|std\\(\\)"`. If the *meanFreq* variables should also be included, the pattern `"mean|std"` can be used, and the pattern `"[M,m]ean|std"` for variables like *gravityMean*. The new data frame is called *meanandstd*.

* The numbers of the *activity* column are replaced with the descriptive names they stand for. These are obtained from the file *activity_labels.txt*. *activity_labels.txt* is comprised of a column *V1* with the numbers 1 to 6 and a column *V2* with the spelled out activities. With the `mutate()` function the numeric values of the *activity* column are replaced with the matching words of the *V2* column of the *activity_labels.txt* file. 

* The data set is grouped by *subject* and *activity* with `group_by()` and with `summarise_each(funs(mean))` the average of each variable is calculated. The resulting data frame is called *tidydata*. The line of code that accomplices these tasks is:
  ```
  tidydata<-meanandstd %>% group_by(subject,activity)%>% summarise_each(funs(mean))
  ```

* Finally the data is saved in *final_dataset.txt*.

<br>


#####Code book
Additionally to the R script a code book (*CodeBook.md*) is available. It consists of information about the origin of the data, the processing and the variables in the resulting data frame.

___

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
