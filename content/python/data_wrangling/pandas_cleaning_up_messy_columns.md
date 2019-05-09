---
title: "Fixing messy columns names the easy way with pandas"
author: "Hampus Sandén"
date: 2017-12-20T11:53:49-07:00
description: "Fixing messy columns names the easy way with pandas"
type: technical_note
draft: false
---
# Cleaning up messy columns

### Import modules


```python
import pandas as pd
import re
```

### Load sample data


```python
df = pd.read_html('http://www.fasttrack.co.uk/league-tables/tech-track-100/league-table/' , header=0)[0]
```


```python
df.head()
```




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
      <th>Rank</th>
      <th>Company</th>
      <th>Location</th>
      <th>Year end</th>
      <th>Annual sales rise over 3 years</th>
      <th>Latest sales £000s</th>
      <th>Staff</th>
      <th>Comment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Plan.comCommunications provider</td>
      <td>Isle of Man</td>
      <td>Sep-17</td>
      <td>364.38%</td>
      <td>*35,418</td>
      <td>90</td>
      <td>About 650 partners use its telecoms platform t...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>PsiOxusBiotechnology developer</td>
      <td>Oxfordshire</td>
      <td>Dec-17</td>
      <td>311.67%</td>
      <td>53136</td>
      <td>54</td>
      <td>Received a $15m milestone payment from its dev...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>CensorNetCloud security software developer</td>
      <td>Basingstoke</td>
      <td>Dec-17</td>
      <td>210.17%</td>
      <td>*7,535</td>
      <td>77</td>
      <td>Has more than 4,000 customers, including McDon...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>thoughtonomyAutomation software developer</td>
      <td>East London</td>
      <td>May-18</td>
      <td>205.20%</td>
      <td>*16,916</td>
      <td>100</td>
      <td>It sells to 28 countries and 50% of revenue is...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>PerkboxEmployee engagement services</td>
      <td>Central London</td>
      <td>Dec-17</td>
      <td>204.12%</td>
      <td>*34,700</td>
      <td>200</td>
      <td>Acquired software platform Loyalty Bay for an ...</td>
    </tr>
  </tbody>
</table>
</div>



### Fix messy column names


```python
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')
```


```python
df.head()
```




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
      <th>rank</th>
      <th>company</th>
      <th>location</th>
      <th>year_end</th>
      <th>annual_sales_rise_over_3_years</th>
      <th>latest_sales_£000s</th>
      <th>staff</th>
      <th>comment</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>Plan.comCommunications provider</td>
      <td>Isle of Man</td>
      <td>Sep-17</td>
      <td>364.38%</td>
      <td>*35,418</td>
      <td>90</td>
      <td>About 650 partners use its telecoms platform t...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2</td>
      <td>PsiOxusBiotechnology developer</td>
      <td>Oxfordshire</td>
      <td>Dec-17</td>
      <td>311.67%</td>
      <td>53136</td>
      <td>54</td>
      <td>Received a $15m milestone payment from its dev...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>3</td>
      <td>CensorNetCloud security software developer</td>
      <td>Basingstoke</td>
      <td>Dec-17</td>
      <td>210.17%</td>
      <td>*7,535</td>
      <td>77</td>
      <td>Has more than 4,000 customers, including McDon...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4</td>
      <td>thoughtonomyAutomation software developer</td>
      <td>East London</td>
      <td>May-18</td>
      <td>205.20%</td>
      <td>*16,916</td>
      <td>100</td>
      <td>It sells to 28 countries and 50% of revenue is...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5</td>
      <td>PerkboxEmployee engagement services</td>
      <td>Central London</td>
      <td>Dec-17</td>
      <td>204.12%</td>
      <td>*34,700</td>
      <td>200</td>
      <td>Acquired software platform Loyalty Bay for an ...</td>
    </tr>
  </tbody>
</table>
</div>


