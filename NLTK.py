#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 28 22:45:52 2026

@author: shantanu
"""
import nltk
from nltk.book import *
text1
text2
### Searching Text
#A concordance view shows us every occurrence of a given word, together with some context
text1.concordance("monstrous")
text2.concordance("affection")
#A concordance permits us to see words in context
#similar range of contexts
text1.similar("monstrous")
text2.similar("monstrous")
#he term common_contexts allows us to examine just the contexts that are shared by two or more words
text2.common_contexts(["monstrous", "very"])
#he term common_contexts allows us to examine just the contexts that are shared by two or more words
#This positional information can be displayed using a dispersion plot
#Each stripe represents an instance of a word, and each row represents the entire text
text1.dispersion_plot(["", "democracy", "freedom", "duties", "America"])

len(text3)
#vocabulary of text
set(text2) #set of tokens that it uses, since in a set, all duplicates are collapsed together
sorted(set(text1)) #  All capitalized words precede lowercase words
len(text1)
len(set(text1)) # distinct words, or "word types." unique items
len(text1)/len(set(text1)) # lexical richness, no of distinct words/total no of words
text1.count("rich")
100*text1.count("a")/len(text1)

text5.count("lol")
def lexical_diversity(text):
    return (len(set(text))/len(text))
lexical_diversity(text2)
def percentage(count, total):
    return 100* count/total
percentage(text3.count("God"), len(text3))

#frequency Distribution
fdist1 = FreqDist(text1)
print(fdist1)
fdist1.most_common(50)
fdist1.plot(50, cumulative=True)
#hapaxes
fdist1.hapaxes() # rare words

# fine grained selection of words
V = set(text1)
longWords = [w for w in V if len(w) > 15]
print(longWords)

sorted(longWords)
# Long words occuring frequently

fdist5 = FreqDist(text5)
sorted(w for w in set(text5) if len(w) > 7 and fdist5[w] > 7)
#Collocations and Bigrams
'''A collocation is a sequence of words that occur together unusually often. 
Thus red wine is a collocation, whereas the wine is not. 
A characteristic of collocations is that they are resistant to substitution with 
words that have similar senses; for example, maroon wine sounds definitely odd.'''

list(bigrams(['more', 'is', 'said', 'than', 'done']))
#collocationns are bigrams with rare occurences
text4.collocations()
''' collocations are essentially just frequent bigrams, 
except that we want to pay more attention to the cases that involve rare words'''
'''In particular, we want to find bigrams that occur more often than 
we would expect based on the frequency of the individual words'''
text8.collocations()
[len(w) for w in text1]
fdist1 = FreqDist(len(w) for w in text1)
print(fdist1)
fdist1
fdist1.most_common()
fdist1.max()
fdist1.freq(3)
fdist['monstrous']


import nltk

from nltk.tokenize import sent_tokenize, word_tokenize
example_string = 'Python is a great course. I have learnt so much'
"""And the first lesson of all was the basic trust that he could learn.
It's shocking to find how many people do not believe they can learn,
and how many more believe learning to be difficult."""

#You can use sent_tokenize() to split up example_string into sentences
sent_tokenize(example_string)
word_tokenize(example_string)

#Filtering Stop Words
nltk.download("stopwords")
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
the_quote = "Sir, I protest. I am not a merry man!"
#tokenize the_quote by word and store the resulting list in words_in_quote
words_in_quote = word_tokenize(the_quote)
words_in_quote
stop_words = set(stopwords.words("english"))
#Next, create an empty list to hold the words that make it past the filter
filtered_list = []
#empty list, filtered_list, to hold all the words in words_in_quote that aren’t stop words
#use stop_words to filter words_in_quote

for word in words_in_quote:
    if word.casefold() not in stop_words:
        filtered_list.append(word)
# .casefold() on word so you could ignore whether the letters in word were uppercase or lowercase
#stopwords.words('english') includes only lowercase versions of stop words
print(filtered_list)
filtered_list

filtered_list = [
    word for word in words_in_quote if word.casefold() not in stop_words]
filtered_list

# Stemming
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
stemmer = PorterStemmer()
string_for_stemming = """The crew of the USS Discovery discovered many discoveries.
Discovering is what explorers do."""

#Before you can stem the words in that string, you need to separate all the words
words = word_tokenize(string_for_stemming)
words
stemmed_words = [stemmer.stem(word) for word in words]
stemmed_words
sagan_quote = """
If you wish to make an apple pie from scratch,
you must first invent the universe."""
#Use word_tokenize to separate the words in that string and store them in a list
words_in_sagan_quote = word_tokenize(sagan_quote)
nltk.pos_tag(words_in_sagan_quote)
nltk.help.upenn_tagset()

l

# Chunking
from nltk.tokenize import word_tokenize
lotr_quote = "It's a dangerous business, Frodo, going out your door."
words_in_lotr_quote = word_tokenize(lotr_quote)
words_in_lotr_quote
nltk.download("averaged_perceptron_tagger")
lotr_pos_tags = nltk.pos_tag(words_in_lotr_quote)
lotr_pos_tags
''' A chunk grammar is a combination of rules on how sentences 
should be chunked. It often uses regular expressions, or regexes'''

grammar = "NP: {<DT>?<JJ>*<NN>}"
''' According to the rule:

    Start with an optional (?) determiner ('DT')
    Can have any number (*) of adjectives (JJ)
    End with a noun (<NN>)'''
    
chunk_parser = nltk.RegexpParser(grammar)
tree = chunk_parser.parse(lotr_pos_tags)
tree.draw

# Text processing
from urllib import request
url = "http://www.gutenberg.org/files/2554/2554-0.txt"
response = request.urlopen(url)
raw = response.read().decode('utf8')
type(raw)
len(raw)
raw[:75]
tokens = word_tokenize(raw)
type(tokens)
len(tokens)
tokens[:10]
text = nltk.Text(tokens)
type(text)
text[1024:1062]
text.collocations()
raw.find("PART I")
raw.rfind("End of Project Gutenberg's Crime")
#Much of the text on the web is in the form of HTML documents
url = "http://news.bbc.co.uk/2/hi/health/2284783.stm"
html = request.urlopen(url).read().decode('utf8')
html[:60]
from bs4 import BeautifulSoup
raw = BeautifulSoup(html, 'html.parser').get_text()
raw
tokens = word_tokenize(raw)
tokens
tokens = tokens[110:390]
text = nltk.Text(tokens)
text.concordance('gene')

import os
os.listdir('.')
f = open('text.txt')
f.read()
for line in f:
    print(line.strip())
path = nltk.data.find('corpora/gutenberg/melville-moby_dick.txt')
raw = open(path, 'r').read()
raw
type(raw)
tokens = word_tokenize(raw)
type(tokens)
words = [w.lower() for w in tokens]
type(words)
vocab = sorted(set(words))
type(vocab)
vocab.append('blog')
print(vocab)

porter = nltk.PorterStemmer()
lancaster = nltk.LancasterStemmer()
raw = """DENNIS: Listen, strange women lying in ponds distributing swords
 is no basis for a system of government.  Supreme executive power derives from
a mandate from the masses, not from some farcical aquatic ceremony."""
tokens = word_tokenize(raw)
[porter.stem(t) for t in tokens]

wnl = nltk.WordNetLemmatizer()
[wnl.lemmatize(t) for t in tokens]
# Sentence Segmentation
len(nltk.corpus.brown.words()) / len(nltk.corpus.brown.sents())
text = nltk.corpus.gutenberg.raw('chesterton-thursday.txt')
sents = nltk.sent_tokenize(text)
print(sents[79:89])

fd = nltk.FreqDist(nltk.corpus.brown.words())
cumulative = 0.0
most_common_words = [word for (word, count) in fd.most_common()]
for rank, word in enumerate(most_common_words):
    cumulative += fd.freq(word)
    print("%3d %6.2f%% %s" % (rank + 1, cumulative * 100, word))
    if cumulative > 0.25:
        break
maxlen = max(len(word) for word in text)
[word for word in text if len(word) == maxlen]

from urllib import request
from bs4 import BeautifulSoup

from urllib import request
from bs4 import BeautifulSoup

def freq_words(url, n):
    html = request.urlopen(url).read().decode('utf8')
    text = BeautifulSoup(html, 'html.parser').get_text()
    freqdist = nltk.FreqDist(word.lower() for word in word_tokenize(text))
    return [word for (word, _) in fd.most_common(n)]
python = "https://docs.python.org/3/tutorial/classes.html"
freq_words(python, 30)