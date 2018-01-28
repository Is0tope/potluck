FROM r-base

RUN echo 'install.packages(c("ggplot2", "tidyr", "dplyr", "recommenderlab", "plumber", "plyr", "reshape2", "RColorBrewer", "scales","grid", "wesanderson"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
    && Rscript /tmp/packages.R

RUN echo 'install.packages(c("jsonlite"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \
    && Rscript /tmp/packages.R

WORKDIR /code