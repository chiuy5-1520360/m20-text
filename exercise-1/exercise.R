# Exercise-1
# Developed from: http://tidytextmining.com/

# Set up (install packages that you don't have)
library(janeaustenr)
library(tidytext)
library(dplyr)
library(stringr)
library(ggplot2)

# Load booksinto a dataframe using the austen_books() function
book.df <- austen_books()

# How many books are in the dataset?
book.df %>% select(book) %>% unique() %>% nrow()

# Which book has the most lines?
#book.frq <- book.df %>% select(book) %>% table() %>% data.frame() 
#colnames(book.frq) <- c("book", "Freq")
#book.frq %>% filter(Freq == max(Freq)) %>% select(book)
book.lines <- book.df %>% group_by(book) %>% summarise(line = n()) %>% filter(line == max(line)) %>% select(book)

# Use the unnest_tokens function to generate the full list of words
all.words <- book.df %>% unnest_tokens(word, text)

# Which words are most common (regardless of which book them come from)?
word.count <- all.words %>% group_by(word) %>% summarise(count = n()) %>% arrange(-count)

# Remove stop words by performing an anti_join with the stop_words dataframe


# Which non stop-words are most common?


# Use ggplot to make a horizontal bar chart of the word frequencies of non-stop words

