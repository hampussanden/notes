---
title: "Pie Chart In MatPlotLib"
author: "Hampus Sandén"
date: 2017-12-20T11:53:49-07:00
description: "Pie Chart In MatPlotLib."
type: technical_note
draft: false
---
## Import modules


```python
import matplotlib.pyplot as plt
%matplotlib inline
```

## Make a Pie Chart plot


```python
# Create a pie chart
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
 
plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With no shadows
        shadow=False,
        # With one slide exploded out eg. Python
        explode=(0, 0.1, 0, 0),
        # With the start angle at 90%
        startangle=90,
        # With the percent listed as a fraction
        autopct='%1.1f%%',
       )
# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal') 

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_4_0.png)




## Add color to your Pie Chart


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']

# Create a pie chart
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]

plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With no shadows
        shadow=False,
        # With one slide exploded out eg. Python
        explode=(0, 0.1, 0, 0),
        # With the start angle at 90%
        startangle=90,
        # With the percent listed as a fraction
        autopct='%1.1f%%',
       )

# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal') 

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_6_0.png)




## Changing label colors on your Pie Chart


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']

# Create a pie chart
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
 
# Specifying return datatypes to iterate
patches, texts, autotexts = plt.pie(
    # Using variable sizes for wedge-sizes
    sizes,
    # Using variable labels for wedge-labels
    labels=labels,
    # With colors
    colors=colors,
    # With no shadows
    shadow=False,
    # With one slide exploded out eg. Python
    explode=(0, 0.1, 0, 0),
    # With the start angle at 90%
    startangle=90,
    # With the percent listed as a fraction
    autopct='%1.1f%%',
    )

# Iterating text and autotext to set new colors
for text in texts:
    text.set_color('grey')
for autotext in autotexts:
    autotext.set_color('grey')
    
# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal')

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_8_0.png)




## Transform your Pie Chart into a donut


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']

# Create a pie chart
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
 
plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With no shadows
        shadow=False,
        # With the start angle at 90%
        startangle=90,
        # With the percent listed as a fraction
        autopct='%1.1f%%',
       )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),0.70,fc='white')
fig = plt.gcf()
fig.gca().add_artist(centre_circle)

# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal')

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_10_0.png)




## Changing the position of labels


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']

# Create a pie chart
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
 
plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With no shadows
        shadow=False,
        # With the start angle at 90%
        startangle=90,
        # With the percent listed as a fraction
        autopct='%1.1f%%',
        # Changing the position of labels
        pctdistance=0.85,
       )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),0.70,fc='white')
fig = plt.gcf()
fig.gca().add_artist(centre_circle)

# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal')

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_12_0.png)




## Explode your donut Pie Chart


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']

# Create a pie chart
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
 
plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With no shadows
        shadow=False,
        # With all slides exploded
        explode=(0.05,0.05,0.05,0.05),
        # With the start angle at 90%
        startangle=90,
        # With the percent listed as a fraction
        autopct='%1.1f%%',
        # Changing the position of labels
        pctdistance=0.85,
       )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),0.70,fc='white')
fig = plt.gcf()
fig.gca().add_artist(centre_circle)

# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal')

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_14_0.png)




## Plot two Pie Charts next to each other


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']
colors_gender = ['#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6']

# Create two pie charts
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
labels_gender = ['Male','Female','Male','Female','Male','Female','Male','Female']
sizes_gender = [315,189,125,212,270,145,190,90]

# Plot first pie chart
plt.subplot(121)
plt.title('Programming Languages')
plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With the start angle at 90%
        startangle=90,
        )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),0.5,color='black', fc='white',linewidth=0)
fig = plt.gcf()
fig.set_size_inches(11,11)
fig.gca().add_artist(centre_circle)

# Plot second pie chart
plt.subplot(122)
plt.title('Python')
plt.pie(# Slicing the variable sizes_gender to only get the first programming language
        sizes_gender[0:2],
        # Slicing the variable labels_gender to only get the first programming language
        labels=labels_gender[0:2],
        # With colors
        colors=colors_gender,
        # With the start angle at 90%
        startangle=90,
        )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),0.5,color='black', fc='white',linewidth=0)
fig = plt.gcf()
fig.set_size_inches(11,11)
fig.gca().add_artist(centre_circle)

plt.show()
```


    

![png](matplotlib_pie_chart_16_0.png)




## Plot two pie charts in one chart


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']
colors_gender = ['#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6']

# Create two pie charts
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
labels_gender = ['Male','Female','Male','Female','Male','Female','Male','Female']
sizes_gender = [315,189,125,212,270,145,190,90]

plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With the start angle at 90%
        startangle=90,
        # With frame
        frame=True,
        )

plt.pie(# Using variable sizes_gender for wedge-sizes
        sizes_gender,
        # With colors
        colors=colors_gender,
        # With the start angle at 90%
        startangle=90,
        # With a radius of 0.75
        radius=0.75,
        )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),0.5,color='black', fc='white',linewidth=0)
fig = plt.gcf()
fig.gca().add_artist(centre_circle)

# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal')

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_18_0.png)




## Explode the chart


```python
# Create a list of colors (from iWantHue)
colors = ['#ff6666', '#ffcc99', '#99ff99', '#66b3ff']
colors_gender = ['#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6', '#c2c2f0','#ffb3e6']

# Create two pie charts
labels = ['Java', 'Python', 'JavaScript', 'C++']
sizes = [504, 337, 415, 280]
labels_gender = ['Male','Female','Male','Female','Male','Female','Male','Female']
sizes_gender = [315,189,125,212,270,145,190,90]

plt.pie(# Using variable sizes for wedge-sizes
        sizes,
        # Using variable labels for wedge-labels
        labels=labels,
        # With colors
        colors=colors,
        # With all slides exploded
        explode=(0.2,0.2,0.2,0.2),
        # With the start angle at 90%
        startangle=90,
        # With frame
        frame=True,
        # With a radius of 3
        radius=3,
        )

plt.pie(# Using variable sizes_gender for wedge-sizes
        sizes_gender,
        # With colors
        colors=colors_gender,
        # With all slides exploded
        explode=(0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1),
        # With the start angle at 90%
        startangle=90,
        # With a radius of 2
        radius=2,
        )

# Convert the pie chart into a circle
centre_circle = plt.Circle((0,0),1.5,color='black', fc='white',linewidth=0)
fig = plt.gcf()
fig.gca().add_artist(centre_circle)

# Equal aspect ratio ensures that pie is drawn as a circle
plt.axis('equal')

# View the plot
plt.tight_layout()
plt.show()
```


    

![png](matplotlib_pie_chart_20_0.png)





```python

```
