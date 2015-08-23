run_analysis <- function() {
  # Load the files
  x_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/Y_test.txt")
  subject_test <- read.table("test/subject_test.txt")
  x_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/Y_train.txt")
  subject_train <- read.table("train/subject_train.txt")
  
  # Merge the test and training data together
  x = rbind(x_test, x_train)
  y = rbind(y_test, y_train)
  subject = rbind(subject_test, subject_train)
  
  # Create a new data frame that contains the subject data, the action they were doing (y),
  # and the mean and std measurements from the x data. I've included a comment for each 
  # column from the x data set and what it corresponds to (these are listed in features.txt
  # in the original data files)
  filtered_data_frame = cbind(
    subject,
    y,
    x[1], # Mean of Body Accelerometer in the X Direction
    x[2], # Mean of Body Accelerometer in the Y Direction
    x[3], # Mean of Body Accelerometer in the Z Direction
    x[4], # Standard Deviation of Body Accelerometer in the X Direction
    x[5], # Standard Deviation of Body Accelerometer in the Y Direction
    x[6], # Standard Deviation of Body Accelerometer in the Z Direction
    x[41], # Mean of Gravitational Accelerometer in the X Direction
    x[42], # Mean of Gravitational Accelerometer in the Y Direction
    x[43], # Mean of Gravitational Accelerometer in the Z Direction
    x[44], # Standard Deviation of Gravitational Accelerometer in the X Direction
    x[45], # Standard Deviation of Gravitational Accelerometer in the Y Direction
    x[46], # Standard Deviation of Gravitational Accelerometer in the Z Direction
    x[81], # Mean of Body Accelerometer Jerk in the X Direction
    x[82], # Mean of Body Accelerometer Jerk in the Y Direction
    x[83], # Mean of Body Accelerometer Jerk in the Z Direction
    x[84], # Standard Deviation of Body Accelerometer Jerk in the X Direction
    x[85], # Standard Deviation of Body Accelerometer Jerk in the Y Direction
    x[86], # Standard Deviation of Body Accelerometer Jerk in the Z Direction
    x[121], # Mean of Body Gyroscope in the X Direction
    x[122], # Mean of Body Gyroscope in the Y Direction
    x[123], # Mean of Body Gyroscope in the Z Direction
    x[124], # Standard Deviation of Body Gyroscope in the X Direction
    x[125], # Standard Deviation of Body Gyroscope in the Y Direction
    x[126], # Standard Deviation of Body Gyroscope in the Z Direction
    x[161], # Mean of Body Gyroscope Jerk in the X Direction
    x[162], # Mean of Body Gyroscope Jerk in the Y Direction
    x[163], # Mean of Body Gyroscope Jerk in the Z Direction
    x[164], # Standard Deviation of Body Gyroscope Jerk in the X Direction
    x[165], # Standard Deviation of Body Gyroscope Jerk in the Y Direction
    x[166], # Standard Deviation of Body Gyroscope Jerk in the Z Direction
    x[201], # Mean of the Magnitude of the Body Accelerometer
    x[202], # Standard Deviation of the Magnitude of the Body Accelerometer
    x[214], # Mean of the Magnitude of the Gravitational Accelerometer
    x[215], # Standard Deviation of the Magnitude of the Gravitational Accelerometer
    x[227], # Mean of the Magnitude of the Body Accelerometer Jerk
    x[228], # Standard Deviation of the Magnitude of the Body Accelerometer Jerk
    x[240], # Mean of the Magnitude of the Body Gyroscope
    x[241], # Standard Deviation of the Magnitude of the Body Gyroscope
    x[253], # Mean of the Magnitude of the Body Gyroscope Jerk
    x[254], # Standard Deviation of the Magnitude of the Body Gyroscope Jerk
    x[266], # Mean of Fourier Transform of Body Accelerometer in the X Direction
    x[267], # Mean of Fourier Transform of Body Accelerometer in the Y Direction
    x[268], # Mean of Fourier Transform of Body Accelerometer in the Z Direction
    x[269], # Standard Deviation of Fourier Transform of Body Accelerometer in the X Direction
    x[270], # Standard Deviation of Fourier Transform of Body Accelerometer in the Y Direction
    x[271], # Standard Deviation of Fourier Transform of Body Accelerometer in the Z Direction
    x[345], # Mean of Fourier Transform of Body Accelerometer Jerk in the X Direction
    x[346], # Mean of Fourier Transform of Body Accelerometer Jerk in the Y Direction
    x[347], # Mean of Fourier Transform of Body Accelerometer Jerk in the Z Direction
    x[348], # Standard Deviation of Fourier Transform of Body Accelerometer Jerk in the X Direction
    x[349], # Standard Deviation of Fourier Transform of Body Accelerometer Jerk in the Y Direction
    x[350], # Standard Deviation of Fourier Transform of Body Accelerometer Jerk in the Z Direction
    x[424], # Mean of Fourier Transform of Body Gyroscope in the X Direction
    x[425], # Mean of Fourier Transform of Body Gyroscope in the Y Direction
    x[426], # Mean of Fourier Transform of Body Gyroscope in the Z Direction
    x[427], # Standard Deviation of Fourier Transform of Body Gyroscope in the X Direction
    x[428], # Standard Deviation of Fourier Transform of Body Gyroscope in the Y Direction
    x[429], # Standard Deviation of Fourier Transform of Body Gyroscope in the Z Direction
    x[503], # Mean of the Magnitude of the Fourier Transform of Body Accelerometer
    x[504], # Standard Deviation of the Magnitude of the Fourier Transform of Body Accelerometer
    x[516], # Mean of the Magnitude of the Fourier Transform of Body Accelerometer Jerk
    x[517], # Standard Deviation of the Magnitude of the Fourier Transform of Body Accelerometer Jerk
    x[529], # Mean of the Magnitude of the Fourier Transform of Body Gyroscope
    x[530], # Standard Deviation of the Magnitude of the Fourier Transform of Body Gyroscope
    x[542], # Mean of the Magnitude of the Fourier Transform of Body Gyroscope Jerk
    x[543] # Standard Deviation of the Magnitude of the Fourier Transform of Body Gyroscope Jerk
  )
  
  # Appropriately label the columns of our new data frame
  colnames(filtered_data_frame) <- c(
    "SubjectID",
    "Action",
    "Mean of Body Accelerometer in the X Direction",
    "Mean of Body Accelerometer in the Y Direction",
    "Mean of Body Accelerometer in the Z Direction",
    "Standard Deviation of Body Accelerometer in the X Direction",
    "Standard Deviation of Body Accelerometer in the Y Direction",
    "Standard Deviation of Body Accelerometer in the Z Direction",
    "Mean of Gravitational Accelerometer in the X Direction",
    "Mean of Gravitational Accelerometer in the Y Direction",
    "Mean of Gravitational Accelerometer in the Z Direction",
    "Standard Deviation of Gravitational Accelerometer in the X Direction",
    "Standard Deviation of Gravitational Accelerometer in the Y Direction",
    "Standard Deviation of Gravitational Accelerometer in the Z Direction",
    "Mean of Body Accelerometer Jerk in the X Direction",
    "Mean of Body Accelerometer Jerk in the Y Direction",
    "Mean of Body Accelerometer Jerk in the Z Direction",
    "Standard Deviation of Body Accelerometer Jerk in the X Direction",
    "Standard Deviation of Body Accelerometer Jerk in the Y Direction",
    "Standard Deviation of Body Accelerometer Jerk in the Z Direction",
    "Mean of Body Gyroscope in the X Direction",
    "Mean of Body Gyroscope in the Y Direction",
    "Mean of Body Gyroscope in the Z Direction",
    "Standard Deviation of Body Gyroscope in the X Direction",
    "Standard Deviation of Body Gyroscope in the Y Direction",
    "Standard Deviation of Body Gyroscope in the Z Direction",
    "Mean of Body Gyroscope Jerk in the X Direction",
    "Mean of Body Gyroscope Jerk in the Y Direction",
    "Mean of Body Gyroscope Jerk in the Z Direction",
    "Standard Deviation of Body Gyroscope Jerk in the X Direction",
    "Standard Deviation of Body Gyroscope Jerk in the Y Direction",
    "Standard Deviation of Body Gyroscope Jerk in the Z Direction",
    "Mean of the Magnitude of the Body Accelerometer",
    "Standard Deviation of the Magnitude of the Body Accelerometer",
    "Mean of the Magnitude of the Gravitational Accelerometer",
    "Standard Deviation of the Magnitude of the Gravitational Accelerometer",
    "Mean of the Magnitude of the Body Accelerometer Jerk",
    "Standard Deviation of the Magnitude of the Body Accelerometer Jerk",
    "Mean of the Magnitude of the Body Gyroscope",
    "Standard Deviation of the Magnitude of the Body Gyroscope",
    "Mean of the Magnitude of the Body Gyroscope Jerk",
    "Standard Deviation of the Magnitude of the Body Gyroscope Jerk",
    "Mean of Fourier Transform of Body Accelerometer in the X Direction",
    "Mean of Fourier Transform of Body Accelerometer in the Y Direction",
    "Mean of Fourier Transform of Body Accelerometer in the Z Direction",
    "Standard Deviation of Fourier Transform of Body Accelerometer in the X Direction",
    "Standard Deviation of Fourier Transform of Body Accelerometer in the Y Direction",
    "Standard Deviation of Fourier Transform of Body Accelerometer in the Z Direction",
    "Mean of Fourier Transform of Body Accelerometer Jerk in the X Direction",
    "Mean of Fourier Transform of Body Accelerometer Jerk in the Y Direction",
    "Mean of Fourier Transform of Body Accelerometer Jerk in the Z Direction",
    "Standard Deviation of Fourier Transform of Body Accelerometer Jerk in the X Direction",
    "Standard Deviation of Fourier Transform of Body Accelerometer Jerk in the Y Direction",
    "Standard Deviation of Fourier Transform of Body Accelerometer Jerk in the Z Direction",
    "Mean of Fourier Transform of Body Gyroscope in the X Direction",
    "Mean of Fourier Transform of Body Gyroscope in the Y Direction",
    "Mean of Fourier Transform of Body Gyroscope in the Z Direction",
    "Standard Deviation of Fourier Transform of Body Gyroscope in the X Direction",
    "Standard Deviation of Fourier Transform of Body Gyroscope in the Y Direction",
    "Standard Deviation of Fourier Transform of Body Gyroscope in the Z Direction",
    "Mean of the Magnitude of the Fourier Transform of Body Accelerometer",
    "Standard Deviation of the Magnitude of the Fourier Transform of Body Accelerometer",
    "Mean of the Magnitude of the Fourier Transform of Body Accelerometer Jerk",
    "Standard Deviation of the Magnitude of the Fourier Transform of Body Accelerometer Jerk",
    "Mean of the Magnitude of the Fourier Transform of Body Gyroscope",
    "Standard Deviation of the Magnitude of the Fourier Transform of Body Gyroscope",
    "Mean of the Magnitude of the Fourier Transform of Body Gyroscope Jerk",
    "Standard Deviation of the Magnitude of the Fourier Transform of Body Gyroscope Jerk"
  )
  
  # Transform the data
  library(reshape)
  melted_data_frame <- melt(filtered_data_frame, id=c("SubjectID","Action"))
  final_data <- cast(melted_data_frame, SubjectID + Action~variable, mean)
  
  # Rename the actions from numbers to descriptive text
  action_labels = c(
    "Walking",
    "Walking Upstairs",
    "Walking Downstairs",
    "Sitting",
    "Standing",
    "Laying"
  )
  final_data[2] <- action_labels
  
  write.table(final_data, "tidy_data.txt", row.name=FALSE)
}