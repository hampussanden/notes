---
title: "Cleaning Up Messy Column Names"
author: "Hampus Sandén"
date: 2020-08-20T11:53:49+02:00
description: "Cleaning Up Messy Column Names"
type: technical_note
draft: false
aliases:
    - /python/pandas_cleaning_up_messy_column_names.html
---
Sometimes you load in that DataFrame from a csv or excel file that some unlucky excel user created and you just wish everyone used Python. Why do they have to make the column names uppercase, with spaces, and whitespace all around? Do they like doing this to you? They probably hate you, that’s it. They did this:


```python
import pandas as pd
```


```python
df = pd.read_csv('data/iowa_liqour_sales.csv')
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
      <th>Invoice/Item Number</th>
      <th>Date</th>
      <th>Store Number</th>
      <th>Store Name</th>
      <th>Address</th>
      <th>City</th>
      <th>Zip Code</th>
      <th>Store Location</th>
      <th>County Number</th>
      <th>County</th>
      <th>...</th>
      <th>Item Number</th>
      <th>Item Description</th>
      <th>Pack</th>
      <th>Bottle Volume (ml)</th>
      <th>State Bottle Cost</th>
      <th>State Bottle Retail</th>
      <th>Bottles Sold</th>
      <th>Sale (Dollars)</th>
      <th>Volume Sold (Liters)</th>
      <th>Volume Sold (Gallons)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>S29198800001</td>
      <td>11/20/2015</td>
      <td>2191</td>
      <td>Keokuk Spirits</td>
      <td>1013 MAIN</td>
      <td>KEOKUK</td>
      <td>52632</td>
      <td>1013 MAIN\nKEOKUK 52632\n(40.39978, -91.387531)</td>
      <td>56</td>
      <td>Lee</td>
      <td>...</td>
      <td>297</td>
      <td>Templeton Rye w/Flask</td>
      <td>6</td>
      <td>750</td>
      <td>$18.09</td>
      <td>$27.14</td>
      <td>6</td>
      <td>$162.84</td>
      <td>4.50</td>
      <td>1.19</td>
    </tr>
    <tr>
      <th>1</th>
      <td>S29195400002</td>
      <td>11/21/2015</td>
      <td>2205</td>
      <td>Ding's Honk And Holler</td>
      <td>900 E WASHINGTON</td>
      <td>CLARINDA</td>
      <td>51632</td>
      <td>900 E WASHINGTON\nCLARINDA 51632\n(40.739238, ...</td>
      <td>73</td>
      <td>Page</td>
      <td>...</td>
      <td>297</td>
      <td>Templeton Rye w/Flask</td>
      <td>6</td>
      <td>750</td>
      <td>$18.09</td>
      <td>$27.14</td>
      <td>12</td>
      <td>$325.68</td>
      <td>9.00</td>
      <td>2.38</td>
    </tr>
    <tr>
      <th>2</th>
      <td>S29050300001</td>
      <td>11/16/2015</td>
      <td>3549</td>
      <td>Quicker Liquor Store</td>
      <td>1414 48TH ST</td>
      <td>FORT MADISON</td>
      <td>52627</td>
      <td>1414 48TH ST\nFORT MADISON 52627\n(40.624226, ...</td>
      <td>56</td>
      <td>Lee</td>
      <td>...</td>
      <td>249</td>
      <td>Disaronno Amaretto Cavalli Mignon 3-50ml Pack</td>
      <td>20</td>
      <td>150</td>
      <td>$6.40</td>
      <td>$9.60</td>
      <td>2</td>
      <td>$19.20</td>
      <td>0.30</td>
      <td>0.08</td>
    </tr>
    <tr>
      <th>3</th>
      <td>S28867700001</td>
      <td>11/04/2015</td>
      <td>2513</td>
      <td>Hy-Vee Food Store #2 / Iowa City</td>
      <td>812  S 1ST AVE</td>
      <td>IOWA CITY</td>
      <td>52240</td>
      <td>812 S 1ST AVE\nIOWA CITY 52240\n</td>
      <td>52</td>
      <td>Johnson</td>
      <td>...</td>
      <td>237</td>
      <td>Knob Creek w/ Crystal Decanter</td>
      <td>3</td>
      <td>1750</td>
      <td>$35.55</td>
      <td>$53.34</td>
      <td>3</td>
      <td>$160.02</td>
      <td>5.25</td>
      <td>1.39</td>
    </tr>
    <tr>
      <th>4</th>
      <td>S29050800001</td>
      <td>11/17/2015</td>
      <td>3942</td>
      <td>Twin Town Liquor</td>
      <td>104 HIGHWAY 30 WEST</td>
      <td>TOLEDO</td>
      <td>52342</td>
      <td>104 HIGHWAY 30 WEST\nTOLEDO 52342\n(41.985887,...</td>
      <td>86</td>
      <td>Tama</td>
      <td>...</td>
      <td>249</td>
      <td>Disaronno Amaretto Cavalli Mignon 3-50ml Pack</td>
      <td>20</td>
      <td>150</td>
      <td>$6.40</td>
      <td>$9.60</td>
      <td>2</td>
      <td>$19.20</td>
      <td>0.30</td>
      <td>0.08</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 24 columns</p>
</div>



    

Now you can’t reference the columns with the convenient .{column name here} notation. You’ll have to do the [''] thing. It’s not the most horrible thing that ever happened, you’ve been through a lot. You can take it. But you’re used to the other way. Plus, what’s with those parentheses? You can’t have that.
Luckily, pandas has a convenient .str method that you can use on text data. Since the column names are an ‘index’ type, you can use .str on them too. You can fix all these lapses of judgement by chaining together a bunch of these .str functions. Like so:


```python
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_').str.replace('(', '').str.replace(')', '')
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
      <th>invoice/item_number</th>
      <th>date</th>
      <th>store_number</th>
      <th>store_name</th>
      <th>address</th>
      <th>city</th>
      <th>zip_code</th>
      <th>store_location</th>
      <th>county_number</th>
      <th>county</th>
      <th>...</th>
      <th>item_number</th>
      <th>item_description</th>
      <th>pack</th>
      <th>bottle_volume_ml</th>
      <th>state_bottle_cost</th>
      <th>state_bottle_retail</th>
      <th>bottles_sold</th>
      <th>sale_dollars</th>
      <th>volume_sold_liters</th>
      <th>volume_sold_gallons</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>S29198800001</td>
      <td>11/20/2015</td>
      <td>2191</td>
      <td>Keokuk Spirits</td>
      <td>1013 MAIN</td>
      <td>KEOKUK</td>
      <td>52632</td>
      <td>1013 MAIN\nKEOKUK 52632\n(40.39978, -91.387531)</td>
      <td>56</td>
      <td>Lee</td>
      <td>...</td>
      <td>297</td>
      <td>Templeton Rye w/Flask</td>
      <td>6</td>
      <td>750</td>
      <td>$18.09</td>
      <td>$27.14</td>
      <td>6</td>
      <td>$162.84</td>
      <td>4.50</td>
      <td>1.19</td>
    </tr>
    <tr>
      <th>1</th>
      <td>S29195400002</td>
      <td>11/21/2015</td>
      <td>2205</td>
      <td>Ding's Honk And Holler</td>
      <td>900 E WASHINGTON</td>
      <td>CLARINDA</td>
      <td>51632</td>
      <td>900 E WASHINGTON\nCLARINDA 51632\n(40.739238, ...</td>
      <td>73</td>
      <td>Page</td>
      <td>...</td>
      <td>297</td>
      <td>Templeton Rye w/Flask</td>
      <td>6</td>
      <td>750</td>
      <td>$18.09</td>
      <td>$27.14</td>
      <td>12</td>
      <td>$325.68</td>
      <td>9.00</td>
      <td>2.38</td>
    </tr>
    <tr>
      <th>2</th>
      <td>S29050300001</td>
      <td>11/16/2015</td>
      <td>3549</td>
      <td>Quicker Liquor Store</td>
      <td>1414 48TH ST</td>
      <td>FORT MADISON</td>
      <td>52627</td>
      <td>1414 48TH ST\nFORT MADISON 52627\n(40.624226, ...</td>
      <td>56</td>
      <td>Lee</td>
      <td>...</td>
      <td>249</td>
      <td>Disaronno Amaretto Cavalli Mignon 3-50ml Pack</td>
      <td>20</td>
      <td>150</td>
      <td>$6.40</td>
      <td>$9.60</td>
      <td>2</td>
      <td>$19.20</td>
      <td>0.30</td>
      <td>0.08</td>
    </tr>
    <tr>
      <th>3</th>
      <td>S28867700001</td>
      <td>11/04/2015</td>
      <td>2513</td>
      <td>Hy-Vee Food Store #2 / Iowa City</td>
      <td>812  S 1ST AVE</td>
      <td>IOWA CITY</td>
      <td>52240</td>
      <td>812 S 1ST AVE\nIOWA CITY 52240\n</td>
      <td>52</td>
      <td>Johnson</td>
      <td>...</td>
      <td>237</td>
      <td>Knob Creek w/ Crystal Decanter</td>
      <td>3</td>
      <td>1750</td>
      <td>$35.55</td>
      <td>$53.34</td>
      <td>3</td>
      <td>$160.02</td>
      <td>5.25</td>
      <td>1.39</td>
    </tr>
    <tr>
      <th>4</th>
      <td>S29050800001</td>
      <td>11/17/2015</td>
      <td>3942</td>
      <td>Twin Town Liquor</td>
      <td>104 HIGHWAY 30 WEST</td>
      <td>TOLEDO</td>
      <td>52342</td>
      <td>104 HIGHWAY 30 WEST\nTOLEDO 52342\n(41.985887,...</td>
      <td>86</td>
      <td>Tama</td>
      <td>...</td>
      <td>249</td>
      <td>Disaronno Amaretto Cavalli Mignon 3-50ml Pack</td>
      <td>20</td>
      <td>150</td>
      <td>$6.40</td>
      <td>$9.60</td>
      <td>2</td>
      <td>$19.20</td>
      <td>0.30</td>
      <td>0.08</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 24 columns</p>
</div>



    
