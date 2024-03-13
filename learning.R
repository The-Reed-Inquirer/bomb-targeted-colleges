library(tidyverse)
library(urltools)

pull_domain <- function(vec) {
  domain_df <- suffix_extract(domain(vec))
  return(domain_df$host)
}

targeted_domains <- c()

for (i in 1:length(domain_split)) {
  targeted_domains <- c(targeted_domains,domain_split[[i]][2])
}

targeted_domains <- unique(targeted_domains)

targeted_df <- suffix_extract(domain(targeted_domains))

df <- read_csv("hd2022.csv")
df$WEBADDR <- pull_domain(df$WEBADDR)

df$WEBADDR <- gsub("www.","",df$WEBADDR)

targeted_df <- targeted_df %>% select(host)

colnames(targeted_df) <- c("WEBADDR")

targeted_df <- left_join(targeted_df,df,by="WEBADDR")

non_targeted_df <- read_csv("hd2022.csv")
non_targeted_df <- non_targeted_df %>% filter(is.na(ICLEVEL) | (ICLEVEL == 1)) %>% filter(!(UNITID %in% targeted_df$UNITID))

random_rows <- sample(1:2617, 286, replace=FALSE)

non_targeted_df <- non_targeted_df[random_rows,]

targeted_df <- cbind(targeted_df,TARGETED=TRUE)
non_targeted_df <- cbind(non_targeted_df,TARGETED=FALSE)

training_df <- rbind(targeted_df,non_targeted_df)

