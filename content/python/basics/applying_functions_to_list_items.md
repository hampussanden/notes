 
---
title: "Applying Functions To List Items"
author: "Hampus Sandén"
date: 2017-12-20T11:53:49-07:00
description: "Applying Functions To List Items"
type: technical_note
draft: false
---


 
Below are three examples of how you would apply a function that capitalizes characters in a list, from `['a', 'b', 'c']` to `['A', 'B', 'C']`. 

In the first example we are using a simple for loop to iterate over each character in the list item. In the second example we are using the built in `map()` function which iterates over the list with str.upper applied. In the third example we apply the string method `upper()` in a list comprehension.


 

## Create a list with characters



 


```python
alphabet = ['g', 'o', 'o', 'g', 'l', 'e']
```



 

## Using A For Loop



 

### Create a for loop that goes through the list alphabet and capitalizes each character



 


```python
# create a variable for the for loop results
alphabet_capitalized_for_loop = []

# for every item in alphabet
for i in alphabet:
    # capitalize the item and add it to alphabet_capitalized_for_loop
    alphabet_capitalized_for_loop.append(i.upper())
    
# view the outcome
alphabet_capitalized_for_loop
```






    ['G', 'O', 'O', 'G', 'L', 'E']







 

## Using Map()



 

### Map the capitalizer function to the list alphabet and convert the map into a list



 


```python
alphabet_capitalized_map = list(map(str.upper, alphabet))

# view the outcome
alphabet_capitalized_map
```






    ['G', 'O', 'O', 'G', 'L', 'E']







 

## Using List Comprehension



 

### Apply the expression x.upper to each item in the list alphabet



 


```python
alphabet_capitalized_list_comprehension = [x.upper() for x in alphabet]

# view the outcome
alphabet_capitalized_list_comprehension
```






    ['G', 'O', 'O', 'G', 'L', 'E']






