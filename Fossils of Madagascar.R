getwd()

# Load paleobioDB package to download occurrences from the PBDB
install.packages("paleobioDB")
library (paleobioDB)

# Download occurrences of Cenozoic terrestrial fossils from Madagascar
# available on the PBDB
# List of taxonomic names of non-terrestrial mammal lineages
?pbdb_taxa
non_terrestrial<-pbdb_taxa(name=c("Pinnipedia", "Pinnipedimorpha",
      "Cetacea","Sirenia"),vocab="pbdb")

?pbdb_occurrences
# it returns a dataframe with fossil occurrences from Madagascar
fossils<-pbdb_occurrences(country="MG", 
max_ma=130,min_ma=0,timerule="contain",
show=c("ident","phylo","coords","loc","paleoloc","time","strat","stratext"),
exclude_id=non_terrestrial$taxon_no, vocab="pbdb",ident="latest",
limit="all")

str(fossils)

# Number of all fossil occurrences through time
hist(fossils$early_age.1, main="Fossil from Madagascar",xlab="Age Ma",
     breaks=c(0:9, seq(10,130,by=10)),freq=TRUE)


# save the file of NA mammals
#write.csv(fossils,file="Madagascar.csv",row.names=FALSE)

