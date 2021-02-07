
library("synapser")
library(synExtra)

synLogin()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#####R markdown to sysnapse wikis 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
syn23516910=ANtibody Project
knitfile2synapse(markdownfile, owner='syn123', parentWikiId = NULL, wikiName = NULL, overwrite = FALSE)

markdownfile: a path to a markdown file (including RMarkdown files)
owner: The Entity where the Wiki page should go (this can be a Project, File, or Folder entity)
parentWikiId: If supplied, will make a sub-Wiki underneath this Wiki ID. Note that this is not a Synapse ID (does not start with syn, it is an integer)


# just open and maintain one markdown file and keep puting text in it knitfile2synapse(markdownfile, owner='syn123', parentWikiId = NULL, wikiName = NULL, overwrite = FALSE)

markdownfile: a path to a markdown file (including RMarkdown files)
owner: The Entity where the Wiki page should go (this can be a Project, File, or Folder entity)
parentWikiId: If supplied, will make a sub-Wiki underneath this Wiki ID. Note that this is not a Synapse ID (does not start with syn, it is an integer)
#craete wikicontent
#markdown guides
#https://www.synapse.org/#!Wiki:syn2467792/ENTITY/64247
knitfile2synapse("testmd.Rmd", owner='syn23531433', parentWikiId = NULL, wikiName = NULL, overwrite = FALSE)


#markdownText <- read.table("~/Desktop/testmd.tsv")
#wiki <- Wiki(owner="syn23531433", title="Analysis summary", markdown=markdownText)
#wiki <- synStore(wiki)



###Other guides 
##https://r-docs.synapse.org/reference/index.html

#get you all wiki 
synGetWiki("syn23531433")


synGetChildren("syn23531433")
#to get wikis  ids to use to modify teh content 
synGetWikiHeaders("syn23516910")


# to add data to a previous folder
dataFolder <- Folder(path =HIPCCHI, parent = "syn23532019")
dataFolder<- synStore(dataFolder)
  synId <- file$properties$id

  
  fileEntity <- synGet("syn23531433")
  fileEntity 
  
  
  
  project <- Project( "TestProjectAmnah")
  project <- synStore(project)
  
  dataFolder <- Folder(path ="data", parent = project)
  dataFolder<- synStore(dataFolder)
  
#to sync data with previous folder on synapse

# to move content between folders on synapse

#to delete 

# to bulk download


#to bulk upload

#start using rest apis wali sari cheezain 
# use hex_digits to generate random string
  #MyUniqueProject synid
  fileEntity <- synGet("syn24215009")
  fileEntity 
  
  #SynStore
  #Creates a new Entity or updates an existing Entity, uploading any files in the 
  #process.
  #either use name or synid 
  project <- Project("MyUniqueProject")
  project <- synStore(project)
  
  project <- Project("syn24215009")
  project <- synStore(project)
  
  #adding new folder in My uniqueproject using its synid/name
  dataFolder <- Folder("John", parent = "syn24215009")
  dataFolder <- synStore(dataFolder)

  
  
  #Now Example of using teh same with SynId
  #adding new folder in My uniqueproject using its synid/name
  # dataFolder <- Folder("Simon", parent = "syn23532058")
  # dataFolder <- synStore(dataFolder)
  
   
  #creating a subfolder  using subfolder synid 
  dataFolder <- Folder("childSimon", parent = "syn24215053")
  dataFolder <- synStore(dataFolder)
  project<-Project("syn24215009")
  
  filesAndFolders <- synGetChildren(project$properties$id, includeTypes = c("file", "folder"))
  test<-as.list(filesAndFolders)
  test
  #Adding files to the project:
  filestoupload<-list.files("/Users/momo/Google Drive/Literature/AntibodyResponsePredictionBaseline/HIPCCHI/")
  path=("/Users/momo/Google Drive/Literature/AntibodyResponsePredictionBaseline/HIPCCHI/")
  
  
  
  #dataFolder can be a child folder or project itself 
  for(i in 1:length(filestoupload)) {
  file <- File(path = paste0(path,filestoupload[i]), parent = "syn23532082")
  file <- synStore(file)
  }
  
  
  #Adding files to the project:
  filestoupload<-list.files("/Users/siddia/Desktop/SynapsePlaying/")
  path=("/Users/siddia/Desktop/SynapsePlaying/")
  
  
  
  #dataFolder can be a child folder or project itself 
  for(i in 1:length(filestoupload)) {
    file <- File(path = paste0(path,filestoupload[i]), parent = "syn24215009")
    file <- synStore(file)
  }
  
 #synctoSynapse jo already folders and projects jhain un k ids use ker k to create ker k update kerta hai 
  files <- synapserutils::syncFromSynapse(' syn395672 ') 
  syncToSynapse("/Users/siddia/Desktop/SynapsePlaying/SYNAPSE_METADATA_MANIFEST.tsv")
  folder <- Folder('Test', parent="syn24215009")
  folder <- synStore(folder)
  
  synExtra::synStoreMany( "/Users/siddia/Desktop/testing", parent="syn24215009")
     