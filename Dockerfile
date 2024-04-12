# make the base image
FROM rocker/r-ver:4.3.2

# R base system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git 

RUN R -e "install.packages(c('ggally', 'tidyverse', 'tidymodels', 'repr', 'gridExtra', 'kknn', 'dplyr', 'knitr', 'devtools', 'testthat', 'docopt'), dependencies=TRUE, repos='https://cran.rstudio.com/', version=c('2.2.1', '1.3.1', '0.1.3', '1.1.3', '2.3', '1.3.1', '1.0.7', '1.36', '2.4.5', '3.2.1', '0.7.1'))"

# install package from github  
RUN R -e 'devtools::install_github("DSCI-310-2024/predictcultivar")'

# run container when launched
CMD ["R"]