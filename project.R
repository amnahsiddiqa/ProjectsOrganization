#synapse
#27
#https://r-docs.synapse.org/reference/index.html
#install.packages("synapser", repos=c("http://ran.synapse.org", "http://cran.fhcrc.org"))
#worked well for installation
#install.packages("synapser", repos=c("https://sage-bionetworks.github.io/staging-ran", "http://cran.fhcrc.org"))
#devtools::install_github("Sage-Bionetworks/knit2synapse")

#dors not work with reticulate packahge in one session 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#Library requirements
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
library("synapser")
library(knit2synapse)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#Login
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#setting up Login details through config file 
#synLogin("amnahsiddiqa@gmail.com", "barabassi123",rememberMe=TRUE)
#Then login without specifying your username and password:
#For Developers
#Customize the Synapse Configuration File
#Synapse configuration parameters for frequently used client-interactions can be set in a specific file. 
#By default, the file is in the user’s home directory and is called .synapseConfig. For example, you can set:
#  a new cache location
#credentials to access files stored outside of Synapse (e.g. AWS-S3, etc.)
#an API key to authenticate login  

#I have put my id and api in config file 
#if i want to change cahe location for downloads i can do it there 
#for now it is set to this in config file location = /Users/momo/SynapseDOwnloads

synLogin()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#####R markdown to sysnapse wikis 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#knitfile2synapse(markdownfile, owner='syn123', parentWikiId = NULL, wikiName = NULL, overwrite = FALSE)

# markdownfile: a path to a markdown file (including RMarkdown files)
# owner: The Entity where the Wiki page should go (this can be a Project, File, or Folder entity)
# parentWikiId: If supplied, will make a sub-Wiki underneath this Wiki ID. Note that this is not a Synapse ID (does not start with syn, it is an integer)
# 
# 
# just open and maintain one markdown file and keep puting text in it knitfile2synapse(markdownfile, owner='syn123', parentWikiId = NULL, wikiName = NULL, overwrite = FALSE)

# markdownfile: a path to a markdown file (including RMarkdown files)
# owner: The Entity where the Wiki page should go (this can be a Project, File, or Folder entity)
# parentWikiId: If supplied, will make a sub-Wiki underneath this Wiki ID. Note that this is not a Synapse ID (does not start with syn, it is an integer)
#craete wikicontent
#markdown guides
#https://www.synapse.org/#!Wiki:syn2467792/ENTITY/64247
#knitfile2synapse("testmd.Rmd", owner='syn23531433', parentWikiId = NULL, wikiName = NULL, overwrite = FALSE)


#markdownText <- read.table("~/Desktop/testmd.tsv")
#wiki <- Wiki(owner="syn23531433", title="Analysis summary", markdown=markdownText)
#wiki <- synStore(wiki)




#Enter the local project name which is same as in synapse project

#Give the path from local directory 
path= "/Users/momo/Google Drive/Codes2020_SiddiqaAmnah/Synapse/CiberSort"

#get the list of subdirectories to iterate for files 
sub.folders <- list.dirs(path, recursive=FALSE)
sub.folders 

setwd(path)
#get the list of files 
sub.files<-setdiff(list.files(), list.dirs(recursive = FALSE, full.names = FALSE))
sub.files

#iterate ove folders and files 

for(t in sub.folders) {
  

  getnamei<-list.files(pattern = "_Expression_Matrices")
  print(getnamei)
  #read and concat one by one
  
  
}


#fileEntity <- synGet("syn23516910")
#fileEntity 

#SynStore
#Creates a new Entity or updates an existing Entity, uploading any files in the 
#process.
#either use name or synid 
#created new director
#checking doing it again will do what ?
project <- Project("CiberSort")
project <- synStore(project)




  #Adding files to the project:
  #give the path of the folder to update 
  path=("/Users/momo/Google Drive/Literature/AntibodyResponsDataProject/LiteratureReviewOfBaselinePredictorMethods/Simon/")
  #get the list of all fiels in that path
  filestoupload<-list.files(path)
  
  #upload data 
  #dataFolder can be a child folder or project itself 
  # juat make sure the synid is either projects or child folder that we want to use 
  for(i in 1:length(filestoupload)) {
  file <- File(path = paste0(path,filestoupload[i]), parent = "syn23532123", forceVersion=FALSE)
  file <- synStore(file)
  }
  
  
  project <- Project("MyUniqueProject") 
  project <- synStore(project)
  id=project$properties$id
  
  
  filesAndFolders <- synGetChildren(project$properties$id, includeTypes = c("file", "folder"))
  as.list(filesAndFolders)
  
  
  
  fileEntity <- synGet
  #get you all wiki 
  synGetWiki("syn23516910")
  
  
  synGetChildren("syn23531433")
  #to get wikis  ids to use to modify teh content 
  synGetWikiHeaders("syn23516910")
  
  
     