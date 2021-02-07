DataOrganizationSynapse
================

## Example projects

<https://www.synapse.org/#!Synapse:syn300013/wiki/27406>

<https://www.synapse.org/#!Synapse:syn1721874/wiki/27329>

<https://www.synapse.org/#!Synapse:syn1899339/wiki/59912>

## Few words about getting started Synapse

This is just for my own short RAM that I am unable to upgrade and if it
helps anybody else too.

  - Keeping all versions scripts in Git and all different versions of
    data in Synapse

  - Would prefer use markdown files instead of scripts files as well
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

library(synExtra) does this cool thing.

To add a new directory with all complex directory structure:

  - pass the synapse project id and local path

  - still playing with versions : pulled the issue at synExtra too and
    for my memory here too
    <https://github.com/amnahsiddiqa/SynapseThingies/issues/1>

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
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## 
    ## Creating test 
    ## Creating Data1 
    ## 
    ## 
    ## 
    ## ################################################## Uploading file to Synapse storage ##################################################
    ## Creating Data2 
    ## 
    ## 
    ## 
    ## ################################################## Uploading file to Synapse storage ##################################################
    ## Creating Data3 
    ## 
    ## 
    ## 
    ## ################################################## Uploading file to Synapse storage ##################################################
    ## Creating Data4 
    ## 
    ## 
    ## 
    ## ################################################## Uploading file to Synapse storage ##################################################
    ## Creating Data4 copy 
    ## 
    ## 
    ## 
    ## ################################################## Uploading file to Synapse storage ##################################################
    ## ################################################## Uploading file to Synapse storage ##################################################

``` r
## The function understands local paths
#synExtra::synStoreMany( ".", "syn12180284" )

## As well as relative paths
#synExtra::synStoreMany( "../myOtherFolder", "syn12180284" )
```

## Bulk download data with file system heirarchy intact

entity  
A Synapse ID, a Synapse Entity object of type folder or project.

path  
An optional path where the file hierarchy will be reproduced. If not
specified the files will by default be placed in the synapseCache.

ifcollision Determines how to handle file collisions. May be
“overwrite.local”, “keep.local”, or “keep.both”. Defaults to
“overwrite.local”.

``` r
files <- synapserutils::syncFromSynapse('syn24606760', path="/Users/siddia/Desktop/SynapseTestProject/test") 
```

## Tables updates

  - Tables can be built up by adding sets of rows that follow a
    user-defined schema and queried using a SQL-like syntax.

  - synBuildTable creates a Table Schema based on the data and returns a
    Table object that can be stored in Synapse using synStore().

  - read more @ <https://r-docs.synapse.org/articles/tables.html>

<!-- end list -->

``` r
#set working directory to where your data is present 
#setwd("/path/to/YourSynapseTableToUpdate")

#read data to include in table 
#data<-read.delim("FileToUpdate.csv", sep=",")

#synBuildTable creates a Table Schema based on the data and returns a 
#Table object that can be stored in Synapse using synStore()
#args 
#--> name of table in synapse project e.g TestTable would be there in your synapse project
#--> the project in Synapse to which this table belongs
#--> name of data object that you just created 
#table <- synBuildTable("TestTable", "syn123456", data)
#table <- synStore(table)
#table$schema
```

## Provenance

Synapse provides tools for tracking ‘provenance’, or the transformation
of raw data into processed results, by linking derived data objects to
source data and the code used to perform the transformation. \* input in
used argument  
\* script file in executed argument

``` r
#Creating an activity object:
# act <- Activity(
#   name = "clustering",
#   description = "whizzy clustering",
#   used = c("syn1234", "syn1235"),
#   executed = "syn4567")


#Storing entities with provenance
# project <- synGet(project$properties$id)
# project <- synStore(project, activity = act)
# We’ve now recorded that ‘project’ is the output of syn4567 applied to the data stored in syn1234 and syn1235.
```
