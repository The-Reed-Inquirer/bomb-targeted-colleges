test <- read_tsv("colleges.txt",col_names=FALSE)

emails_df <- as.data.frame(emails)
cross_analysis <- emails_df %>% filter(!(emails %in% test$X2))
