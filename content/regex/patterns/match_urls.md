---
title: "Match URLs"
author: "Hampus Sandén"
date: 2017-12-20T11:53:49-07:00
description: "Match URLs in Python."
type: technical_note
draft: false
---
## Preliminaries


```python
# Load regex package
import re
```

## Create some text


```python
# Create a variable containing a text string
text = 'My blog is http://www.hampussanden.com and not http://hampussanden.com'
```

## Apply regex


```python
# Find any ISBN-10 or ISBN-13 number
re.findall(r'(http|ftp|https):\/\/([\w\-_]+(?:(?:\.[\w\-_]+)+))([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?', text)
```




    [('http', 'www.hampussanden.com', ''), ('http', 'hampussanden.com', '')]


