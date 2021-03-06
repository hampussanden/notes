 
---
title: "Cleaning Up Messy Column Names"
author: "Hampus Sandén"
date: 2020-08-20T11:53:49+02:00
description: "Cleaning Up Messy Column Names"
type: technical_note
draft: true
aliases:
    - /python/pandas_cleaning_up_messy_column_names.html
---


 

Sometimes you load in that DataFrame from a csv or excel file that some unlucky excel user created and you just wish everyone used Python. Why do they have to make the column names uppercase, with spaces, and whitespace all around? Do they like doing this to you? They probably hate you, that’s it. They did this:



 

### Import modules



 


```python
import pandas as pd
```



 


```python
df = pd.read_csv('data/solar_power_plant.csv')
df.head()
```


<div class="dataframe-wrapper">
    



<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>DATE TIME</th>
      <th>PLANT ID</th>
      <th>SOURCE KEY</th>
      <th>DC POWER</th>
      <th>AC POWER</th>
      <th>DAILY YIELD</th>
      <th>TOTAL YIELD</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>1BY6WEcLGh8j5v7</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6259559</td>
    </tr>
    <tr>
      <th>1</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>1IF53ai7Xc0U56Y</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6183645</td>
    </tr>
    <tr>
      <th>2</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>3PZuoBAID5Wc2HD</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6987759</td>
    </tr>
    <tr>
      <th>3</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>7JYdWkrLSPkdwr4</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>7602960</td>
    </tr>
    <tr>
      <th>4</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>McdE0feGgRqW7Ca</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>7158964</td>
    </tr>
  </tbody>
</table>
</div>



</div>




 

Now you can’t reference the columns with the convenient .{column name here} notation. You’ll have to do the [''] thing. It’s not the most horrible thing that ever happened, you’ve been through a lot. You can take it. But you’re used to the other way. Plus, what’s with those parentheses? You can’t have that.
Luckily, pandas has a convenient .str method that you can use on text data. Since the column names are an ‘index’ type, you can use .str on them too. You can fix all these lapses of judgement by chaining together a bunch of these .str functions. Like so:



 


```python
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')
df.head()
```


<div class="dataframe-wrapper">
    



<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date_time</th>
      <th>plant_id</th>
      <th>source_key</th>
      <th>dc_power</th>
      <th>ac_power</th>
      <th>daily_yield</th>
      <th>total_yield</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>1BY6WEcLGh8j5v7</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6259559</td>
    </tr>
    <tr>
      <th>1</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>1IF53ai7Xc0U56Y</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6183645</td>
    </tr>
    <tr>
      <th>2</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>3PZuoBAID5Wc2HD</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>6987759</td>
    </tr>
    <tr>
      <th>3</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>7JYdWkrLSPkdwr4</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>7602960</td>
    </tr>
    <tr>
      <th>4</th>
      <td>15-05-2020 00:00</td>
      <td>4135001</td>
      <td>McdE0feGgRqW7Ca</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>7158964</td>
    </tr>
  </tbody>
</table>
</div>



</div>



