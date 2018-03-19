# Lecture 4
## Natural Language Interpretation.
---
A language that develops naturally through use and repetition by humans are called a "Natural Language", the language can be anbigous and still work. While a formal language like a programming language have a very strict syntax and semantics, errors here will make the program uncoprehensive, i.e. unable to be run. 

Processing this language are called Natural Language Processing

# Natural Language Processing
Today a lot of NLP is dove via machine learning, i.e. statistics. 
As words can be split into different lexical categories, we can combine these to create comprehensive sentances, grammar is a set of rules that dictates which combinations are legal.

Examples of grammar is a context-free grammar, which is a four tuple containing, a finite set of non terminals, a finite set of terminals, a set of production rules and a start symbol. 

# Parsing (also called syntactic analysis)
Given a grammar and a string, formulate a valid command/sentance in regards to that grammar. Examples of algorithms include CKY algorithm. 

Ususally sentances contain unabigouity, we are good at "filtering out" this. 