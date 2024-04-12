# make the base image
FROM rocker/r-ver:4.3.2

# R base system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    git 

#RUN R -e "install.packages(c('ggally', 'tidyverse', 'tidymodels', 'repr', 'gridExtra', 'kknn', 'dplyr', 'knitr', 'devtools', 'testthat', 'docopt'), dependencies=TRUE, repos='https://cran.rstudio.com/', version=c('2.2.1', '1.3.1', '0.1.3', '1.1.3', '2.3', '1.3.1', '1.0.7', '1.36', '2.4.5', '3.2.1', '0.7.1'))"
RUN R -e "install.packages('tidyverse', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='2.0.0')"
RUN R -e "install.packages('tidymodels', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='1.1.1')"
RUN R -e "install.packages('kknn', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='1.3.1')"
RUN R -e "install.packages('dplyr', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='1.1.4')"
RUN R -e "install.packages('knitr', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='1.45')"
RUN R -e "install.packages('devtools', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='2.4.5')"
RUN R -e "install.packages('testthat', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='3.2.1')"
RUN R -e "install.packages('docopt', lib='/usr/local/lib/R/site-library', dependencies=TRUE, repos='https://cran.rstudio.com/', version='0.7.1')"

# install package from github  
RUN Rscript -e 'devtools::install_github("DSCI-310-2024/predictcultivar@1.0.0", upgrade = FALSE)'

#FROM quay.io/jupyter/r-notebook:r-4.3.2
# install necessary packages for analysis

# Install required R packages
#RUN conda install -y \
#    r-base=4.2.1 \
#    r-ggally=2.2.1 \
#   r-tidyverse=1.3.1 \
#    r-tidymodels=0.1.3 \
#    r-repr=1.1.3 \
#    r-gridextra=2.3 \
#    r-kknn=1.3.1 \
#    r-dplyr=1.1.4 \
#    r-knitr=1.36 \
#    r-devtools=2.4.5 \
#    r-testthat=3.2.1 \
#    r-docopt=0.7.1 
    
#RUN Rscript -e 'devtools::install_github("DSCI-310-2024/predictcultivar@1.0.0", upgrade = FALSE)'
    

