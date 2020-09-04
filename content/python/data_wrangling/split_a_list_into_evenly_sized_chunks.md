---
title: "Split a list into evenly sized chunks"
author: "Hampus Sandén"
date: 2020-08-20T11:53:49+02:00
description: "Split a list into evenly sized chunks"
type: technical_note
draft: false
aliases:
    - /python/split_a_list_into_evenly_sized_chunks.html
---
In this snippet we will take a list of arbitrary length and split it up into equal size chunks. It is very common that you will have to do this when working with APIs that have a maximum request size. The most elegant way to do this in python is to use a generator function that will keep slicing your list into another list of given size.

This function differs from a regular function, because we are using the yield keyword which enables the function to comeback where it left off when it is called again. The yield keyword will help a function to remember its state and enables it to suspend and resume while it turns in a value at the time of the suspension of the execution.


```python
# Create a list of first names
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
```


```python
# Create a function called "chunks" with two arguments, l and n:
def chunks(l, n):
    # For item i in a range that is a length of l,
    for i in range(0, len(l), n):
        # Create an index range for l of n items:
        yield l[i:i+n]
```


```python
# Create a list that from the results of the function chunks:
list(chunks(numbers, 5))
```




    [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17]]


