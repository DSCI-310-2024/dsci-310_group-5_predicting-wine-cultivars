# Predicting Wine Cultivars

Contributors:
Zhibek Dzhunusova, Andrea Jackman, Kaylan Wallace, Chuxuan Zhou.

A data science project for DSCI 310

## About 
 
In this project, we asked whether we could predict what cultivar a wine was derived from based on its chemical properties.

The data was sourced from the [UCI Machine Learning Repository](https://doi.org/10.24432/C5PC7J) (Aberhard et al. 1991). It contains data about 178 wines from Italy derived from three different cultivars. Each row represents the chemical and physical properties of a different wine, such as the alcohol concentration, magnesium level, and hue.

Using a k-nearest neighbors algorithm we attempted to predict the cultivar of an unknown wine based on physiochemical properties such as alcohol content and magnesium levels. Our model achieved 98% accuracy on our test data, but struggled to accurately predict the origin of wines from cultivar 2. This demonstrates that most cultivars are strongly distinguished by their physiochemical properties with some overlap between similar cultivars. Our analysis effectively identified chemical properties that strongly distinguish cultivars. This provides valueable information for winemakers about which grapes to cultivate to achieve their desired wine characteristics and informs future innovation in the wine industry.

## Report

View a pdf version of the final report [here](https://github.com/DSCI-310-2024/dsci-310_group-5_predicting-wine-cultivars/blob/main/reports/report.pdf)

## Usage

### Clone the project to your computer

1. In your terminal navigate to the desired directory for this project using
```
cd <directory>
```
3. In the terminal type
```
git clone https://github.com/DSCI-310-2024/dsci-310_group-5_predicting-wine-cultivars.git
```
5. Navigate to the project directory using
```
cd dsci-310_group-5_predicting-wine-cultivars
```
7. Open the project using RStudio or your desired application

### Using the container to replicate the dependencies and run the analysis

1. [Install docker](https://www.docker.com/get-started/) if you have not already done so
2. Launch the docker application (for Mac and Windows users only)
3. Run this command in the bash terminal to get the latest version of the container 
```
docker pull ajackman48/dsci-310-group-5:latest
```
4. To run the entire analysis use this code:
```
docker-compose run analysis-env
```
5. Run this command in the bash terminal to delete previous versions of the analysis
```
make clean
```
6. Run this command in the bash terminal to recreate the entire analysis
```
make all
```

### Running the function tests

1. In the R terminal run
```
testthat::test_dir("tests/testthat")
```

### Generating html and PDF versions of the report

1. In a bash terminal run
```
make all
```
2. Navigate to the project folder and open the generated html and pdf files

## Dependencies 

R is the main language used for analysis. Docker is the software used to create the container and the project is based on the ```rocker/r-ver:4.3.2``` image. Additional dependencies and package versions are specified in the [Dockerfile](https://github.com/DSCI-310-2024/dsci-310_group-5_predicting-wine-cultivars/blob/main/Dockerfile)

## License

**MIT License**

Copyright (c) 2024 Zhibek Dzhunusova, Andrea Jackman, Kaylan Wallace, Chuxuan Zhou

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

**Creative Commons License**

Copyright (c) 2024 Zhibek Dzhunusova, Andrea Jackman, Kaylan Wallace, Chuxuan Zhou

This report is made available under the Attribution-NonCommercial-ShareAlike 4.0 International [(CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).

## Attribution

Tiffany Timbers, Melissa Lee & Joel Ostblom [breast_cancer_predictor_py](https://github.com/ttimbers/breast_cancer_predictor_py/blob/main/README.md)

## References

Aeberhard, S. and Forina, M.. (1991). Wine. UCI Machine Learning Repository. https://doi.org/10.24432/C5PC7J.

R Core Team. (2022). R (4.3.2): A Language and Environment for Statistical Computing. R Foundation for Statistical Computing. https://www.r-project.org/

