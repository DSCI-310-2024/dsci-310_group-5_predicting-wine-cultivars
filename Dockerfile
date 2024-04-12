# make the base image
FROM quay.io/jupyter/r-notebook:r-4.3.2
# install necessary packages for analysis

# Install required R packages
RUN conda install -y \
    r-base=4.3.2 \
    r-tidyverse=2.0.0 \
    r-tidymodels=1.1.1 \
    #r-repr=1.1.7 \
    r-gridextra=2.3 \
    r-kknn=1.3.1 \
    r-dplyr=1.1.4 \
    r-knitr=1.45 \
    r-devtools=2.4.5 \
    r-testthat=3.2.1 \
    r-docopt=0.7.1 
    
RUN Rscript -e 'devtools::install_github("DSCI-310-2024/predictcultivar@1.0.0", upgrade = FALSE)'