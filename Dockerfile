# make the base image
FROM rocker/r-ver:4.3.2

# R base system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libcairo2-dev \
    libxt-dev \
    git 

RUN conda install -y \
    r-ggally=2.1.1 \
    r-tidyverse=1.3.1 \
    r-tidymodels=0.1.3 \
    r-repr=1.1.3 \
    r-gridextra=2.3 \
    r-kknn=1.3.1 \
    r-knitrr=1.36 \
    r-devtools=2.4.5 \
    r-testthat=3.2.1 \
    r-docopt=0.7.1 \
    quarto=1.4.550 \
    make



# installing our package
RUN R -e "devtools::install_github('DSCI-310-2024/predictcultivar', dependencies = TRUE, upgrade = FALSE)"

# run container when launched
CMD ["R"]