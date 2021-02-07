DataOrganizationSynapse
================

## Few words about getting started Synapse

This is just for my own short RAM that I am unable to upgrade and if it
helps anybody else too.

  - I consider Synapse as data-Github- I would prefer to keep all
    versions scripts in Git and all different versions of data in
    Synapse

  - I prefer to use markdown files instead of scripts files as well
    unless i am integrating a full workflow.

For getting started follow some introductions here:

  - <https://r-docs.synapse.org/articles/synapser.html>

  - <https://r-docs.synapse.org/articles/synapser.html>

  - To access synExtra at git:
    <https://github.com/ArtemSokolov/synExtra>

  - Examples of setting up synapse config files parameters @
    <https://github.com/Sage-Bionetworks/synapsePythonClient/blob/master/synapseclient/.synapseConfig>

  - We have three options to set up login. If you dont need to deal with
    other clients frequently e.g AWS-S3 etc synLogin is enough otherwise
    you can setup configuration file as mentioned above.

  - By default data downloaded from Synapse is cached at user’s home
    directory and is called .synapseConfig unless specified; We can fix
    it in .synapseConfig file to a new cache location too.

  - Note:does not work with reticulate package in one session

<!-- end list -->

``` r
#install.packages("synapser", repos = c("http://ran.synapse.org", "http://cran.fhcrc.org"))
#if( !require(devtools) ) install.packages( "devtools" )
#devtools::install_github( "ArtemSokolov/synExtra" )
library(synapser)
library(synExtra)
```

## login to Synapse

How to configure login details Long Story read
@https://r-docs.synapse.org/articles/manageSynapseCredentials.html

short story here

  - if you have a synapse account registered
  - pass your username and password for synapse in synLogin function
    e.g. “synLogin(”username“,”password“,rememberMe=True))”
  - you just need to do it once and from next time you will not have to
    enter your username or password like below

<!-- end list -->

``` r
synLogin()
```

    ## Welcome, amnah siddiqa!

    ## NULL

### Updating a data directory with complex structure in Synapse

library(synExtra) has all the cool things to do here for us.

To add a new directory with all complex directory structure:

  - pass the synapse project id and local path

  - still playing with versions : pulled the issue

  - read more on versions of files @
    <https://docs.synapse.org/articles/files_and_versioning.html>

<!-- end list -->

``` r
synExtra::synStoreMany( "/Users/siddia/Desktop/SynapseTestProject", parent="syn24215009")
```

    ## Creating SynapseTestProject 
    ## 
    ## 
    ## 
    ## Creating SomeData 
    ## Creating Data1 
    ## 
    ## 
    ## 
    ## Creating Data2 
    ## 
    ## 
    ## 
    ## Creating Data3 
    ## 
    ## 
    ## 
    ## Creating Data4 
    ## 
    ## 
    ## 
    ## Creating Data4 copy 
    ## 
    ## 
    ## 
    ## Creating SuppCIBERSORT

``` r
## The function understands local paths
#synExtra::synStoreMany( ".", "syn12180284" )

## As well as relative paths
#synExtra::synStoreMany( "../myOtherFolder", "syn12180284" )
```

``` r
#project <- Project( "TestProjectAmnah")
#project <- synStore(project)
```

``` r
#project <- Project( "TestProjectAmnah")
#project <- synStore(project)
```

## 

You can also embed plots, for example:

``` r
# #Adding files to the project:
#   filestoupload<-list.files("/Users/siddia/Google Drive/Codes2020_SiddiqaAmnah/Synapse/CiberSort/")
#   path=("/Users/momo/Google Drive/Literature/AntibodyResponsePredictionBaseline/HIPCCHI/")
#   
#   
#   
#   #dataFolder can be a child folder or project itself 
#   for(i in 1:length(filestoupload)) {
#   file <- File(path = paste0(path,filestoupload[i]), parent = "syn23532082")
#   file <- synStore(file)
#   }
```

``` r
# Load required libraries
# library(synapser)
# library(synapserutils)

# login to Synapse
#synLogin(email='me@example.com', password='secret', rememberMe=TRUE)
# synLogin()
# download all the files in folder syn123 to a local folder called "myFolder"
#all_files = syncFromSynapse(entity='syn24215009', path='/Users/siddia/Desktop/SynapsePlaying')
```

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.