# WGM_analysis
Code used for FX29 force sensor in combination with a HX711 signal analysis.
Matlab.analysis_measurement is the script used to analyse data obtained by experiments.
Emptycylindermeasurements.m is the script used to analyse empty cylinder measurements.

The calibration factor.ino and measurement.ino scripts are based on files from https://github.com/sparkfun/HX711-Load-Cell-Amplifier adjusted to my needs.
The measurement script also uses an Arduino Library from https://github.com/bogde/HX711


Sensor wiring done using

![afbeelding](https://user-images.githubusercontent.com/86842299/233704644-0c4485a1-62b6-446e-be6a-27b020ff1eb8.png)
in combination with
![afbeelding](https://user-images.githubusercontent.com/86842299/233705583-2846db87-6482-4d15-a2f8-6ccb201f83d1.png)
Note pin connections:
pin 4 RED        V+ <->  E+  
pin 3 YELLOW     O+ <->  A+  
pin 2 WHITE      O- <->  A-  
pin 1 BLACK      V- <->  E-  

