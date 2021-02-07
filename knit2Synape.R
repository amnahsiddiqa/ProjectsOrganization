
#devtools::install_github("Sage-Bionetworks/knit2synapse")
#does not work with reticulate packahge in one session 
library(knit2synapse)

synLogin()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#####R markdown to sysnapse wikis 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
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






