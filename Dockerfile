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

R -e "install.packages(c('GGally', 'tidyverse', 'tidymodels', 'repr', 'gridExtra', 'kknn', 'dplyr', 'knitr', 'devtools', 'testthat', 'docopt'), 
  versions=c('2.1.1', '1.3.1', '0.1.3', '1.1.3', '2.3', '1.3.1', '1.0.7', '1.36', '2.4.5', '3.2.1', '0.7.1'), dependencies=TRUE, repos='https://cran.rstudio.com/')"

# installing our package
RUN R -e "devtools::install_github('DSCI-310-2024/predictcultivar', dependencies = TRUE, upgrade = FALSE)"

# run container when launched
CMD ["R"]