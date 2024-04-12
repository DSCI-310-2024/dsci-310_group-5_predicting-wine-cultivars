# make the base image
FROM rocker/r-ver:4.3.2

# R base system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git \
    r-cran-ggally \
    r-cran-tidyverse \
    r-cran-tidymodels \
    r-cran-repr \
    r-cran-gridextra \
    r-cran-kknn \
    r-cran-dplyr \
    r-cran-knitr \
    r-cran-devtools \
    r-cran-testthat \
    r-cran-docopt

# install package from github  
RUN R -e 'devtools::install_github("DSCI-310-2024/predictcultivar")'

# run container when launched
CMD ["R"]