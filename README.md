This project is initialzed to make the original data public available and let the reader check if the post-processing scripts are correct or not.

A. the P(T,E), p(T,E) and dT(T,E) plots.

1. The basic data is recorded in plain text files, with each file consists of seven columns

%x coodinate   %y coodinate    %Px %Py  %ux  %uy  %phi

for example

...

-19.000         -3.3248        1.7694E-9      0.38086        -8.8067E-10    -2.3874E-4     -0.15158
-18.600         -3.3248        1.6096E-9      0.38086        -9.7668E-10    -2.3874E-4     -0.15158
...
-10.600         -3.3248        4.0267E-11     0.38086        3.8721E-10     -2.3874E-4     -0.15158
-10.200         -3.3248        3.3549E-11     0.38086        3.7732E-10     -2.3874E-4     -0.15158

...


2. To construtct the P(T,E) surfaces, we perform a large amount of computaions by assigning different values of [Field] and [Temperature]. Note we care about the effect caused by numbers of vorices and thickness of STO layers, so that we also have two additional variables, namely  [Layer] and [Seed]. Therefore, the dataset is huge and high dimentional. 

We upload a portion of the data to the OneDrive (2.7GB) for examination. The data corresponds to 61 [temperature] times 100 [seed] at a constant field (100 kV/m) and constant STO thickness (5 layers).

https://1drv.ms/u/s!AozeN-B9ZzQkiFEwxTEbEFLDGgjV

The size of whole data is roughly 500GB, thus too big to upload. One can reach them if needed by request with no futher restrictions.


3. The huge data set should be reduced before analysis. We extract four values from each basic file as following

% average Px  % average Py % average P:=sqrt(Px^2+Py^2) % number of vortices

by using a matlab script "countV.m". The output of the scripts is small and managable. In this project, we provide all the data for 1-5 STO layers, we refer them as L1.mat --L5.mat.


4. The extracted data should be clustered by the vortices numbers by a semi-automatic approach.

A customed function "clusterV.m" is called by another script "clustering.m". One runs the latter script and it plots the P-T curves of 100 seeds at a series of fields one by one. The user should specify the desired number of braches based on what is seen in the plots, then the script assess whether it is reasonable. The script give the representive curves of each classes so that you can visually compare them. Besides, the scripts return the cluster index, which shoud be good if it is near unity. User can accept the results by type "1" in the command line or deny it with "0" and restart the proceess again. The clustered data is saved in a new data file. In corresponce to 1-5 layers, we refer them as 1uc.mat -- 5uc.mat. This step mainly designed to rapidly divide the 100 seeds into several groups depending on the evolution tendencies. Be aware of that the scrpits may fail at rare cases, manual verification is encouraged if the clustering results is not satisfying.   

5. The data to reproduce the figures in the manuscript is ready for use now. We can use the equations in the manuscripts to compute the final form in the P(T,E), p(T,E) and dT(T,E) plots. This process is impletmented by another scripts: "ece.m". Note the final plots are exported directly from Originlab rather than Matlab, but all the coumputations are finished in Matlab.


B. the toriodization plots 

The toriodization plots are given by the script "vortices.m".

C. Data about the heat capacity is self explainary.

