getwd()

# Load paleobioDB package to download occurrences from the PBDB
install.packages("paleobioDB")
library (paleobioDB)

# Download occurrences of Cretaceous and Cenozoic terrestrial plants and
# vertebrate fossils from Madagascar available on the PBDB

# List of taxonomic names of non-terrestrial mammal lineages
?pbdb_taxa
non_terrestrial<-pbdb_taxa(name=c(
"Pinnipedia", "Pinnipedimorpha","Cetacea","Sirenia"),vocab="pbdb")
str(non_terrestrial)

?pbdb_occurrences
# it returns a dataframe with fossil occurrences from Madagascar
fossils<-pbdb_occurrences(
base_name=c("Angiospermae","Chordata","Coniferophyta","Ginkgophyta",
            "Spermatophyta","Tracheophyta" ),
country="MG", 
max_ma=145,min_ma=0,timerule="contain",
show=c("ident","phylo","coords","loc","paleoloc","time","strat","stratext"),
exclude_id=non_terrestrial$taxon_no,
vocab="pbdb",ident="latest",limit="all")

str(fossils)

# Number of all fossil occurrences through time
hist(fossils$early_age.1, 
     main="Fossil terrestrial plants and vertebrates from Madagascar",
     xlab="Age Ma",
     breaks=c(0:9, seq(10,145,by=10)),freq=TRUE)


# save the file of Cretaceous and Cenozoic fossils from Madagascar
write.csv(fossils,file="Fossils_Madagascar.csv",row.names=FALSE)

