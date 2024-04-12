# make the base image
FROM rocker/r-ver:4.3.2

# R base system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git 

RUN conda install -y \
    r-cran-ggally=2.2.1 \
    r-cran-tidyverse=1.3.1 \
    r-cran-tidymodels=0.1.3 \
    r-cran-repr=1.1.3 \
    r-cran-gridextra=2.3 \
    r-cran-kknn=1.3.1 \
    r-cran-dplyr=1.0.7 \
    r-cran-knitr=1.36 \
    r-cran-devtools=2.4.5 \
    r-cran-testthat=3.2.1 \
    r-cran-docopt=0.7.1

# install package from github  
RUN R -e 'devtools::install_github("DSCI-310-2024/predictcultivar")'

# run container when launched
CMD ["R"]