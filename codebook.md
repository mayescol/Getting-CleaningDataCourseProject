#Code Book
This code book summarizes the resulting data fields in tidy.txt.

Column 1 "subject": contains the numeric identifier of the 30 observations for 6 subjects. 
Column 2 "activity": identifies the type of activity performed by the subjects, the 6 activities are: 
    *LAYING
    *SITTING 
    *STANDING
    *WALKING
    *WALKING_DOWNSTAIRS
    *WALKING_UPSTAIRS
    
Columns 3 to 88:Variables which represent measurements taken using the accelerometer and gyroscope 3-axial when the subject moved. 
Variables with "FrequencyBody" contains data after the Fast Fourier Transform.
Variables with "TimeBody" contains data before the Fast Fourier Transform.
Variables ending with "mean()-X/Y/Z" contains the mean value of the data or for its axis.
Variables ending with "std()-X/Y/Z" contains the standard deviation of the data or for its axis.
The middle of the variable name contains what exactly is the data and its procedence, if it was taken from the accelerometer or from the gyroscope.
