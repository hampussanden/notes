 
---
title: "Clustering A List Of Words"
author: "Hampus Sandén"
date: 2020-08-20T11:53:49+02:00
description: "Clustering A List Of Words"
type: technical_note
draft: false
aliases:
    - /python/clustering_a_list_of_words.html
---


 


```python
from fuzzywuzzy import fuzz

word_list = ['ancestor', 'ancestry', 'elder', 'elderly', 'parent', 'parentage']
print('input words:', word_list)

groups = list()
for word in word_list:
    for g in groups:
        if all(fuzz.ratio(word, w) > 75 for w in g):
            g.append(word)
            break
    else:
        groups.append([word, ])

print('output groups:', groups)
```



    input words: ['ancestor', 'ancestry', 'elder', 'elderly', 'parent', 'parentage']
    output groups: [['ancestor', 'ancestry'], ['elder', 'elderly'], ['parent', 'parentage']]





