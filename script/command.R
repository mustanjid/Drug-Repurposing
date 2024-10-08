#Gene collection procedure using r
install.packages("rentrez")
library(rentrez)
entrez_dbs()
entrez_db_searchable("gene")
r_search <- entrez_search(db = "gene", term = "Heart[ALL] & homo sapiens[Human]", retmax=200)
r_search
r_search$ids
r_seqs <- entrez_fetch(db="gene", id= r_search$ids, rettype="txt", retmode = "text")
r_seqs

#Gene filtering procedure using r
r_search <- entrez_search(db="gene", term = "Heart[ALL] & homo sapiens[Human]", retmax = 200)
r_search

#Gene sorting procedure using r
r_seqs1 <- write(r_seqs, file = "t.txt")


#Gene linkage procedure using r
r_search <- entrez_search(db="gene", term = "Heart[ALL] & schizophrenia[ALL]", retmax = 200)
r_search
r_search$ids
r_seqs <- entrez_fetch(db="gene", id=r_search$ids, rettype = "txt", retmode = "text")


#Gene mining procedure using r
install.packages("tm")

library(tm)
text <- readLines("t.txt")
docs <- Corpus(VectorSource(text))
inspect(docs)
docs <- docs[-(1:3)]
docs <- tm_map(docs, removeWords, c("dd", "dt", "class", "dl", "desig","details"))
df <- head(docs, 100)
inspect(df)

df <- read.table("t.txt", fill = TRUE, header = FALSE)
df
df <- -df[,-(3:227)]