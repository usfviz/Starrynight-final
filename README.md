Flight Visualization
==============================

Team: 
April (Yichen) Liu (ywang348@usfca.edu)
Zefeng Zhang (zzhang107@dons.usfca.edu)

Instructions
----------------

The following packages must be installed prior to running this code:

* shiny
* networkD3
* wordcloud
* tm
* geosphere
* maps
* nycflights13
* sp
* reshape
* dplyr
* knitr
* tidyr

To run this code, please enter the following commands in R:

```
library(shiny)
shiny::runGitHub('aprilyichenwang/flight_visualization')
```

This will start the `shiny` app. See below for details on how to interact with the visualization.

Plots 
----------------

Below are four screenshots of the interface of the shiny app.

![alt text](https://github.com/usfviz/Starrynight-/blob/master/images/flight_table.png)

![alt text](https://github.com/usfviz/Starrynight-/blob/master/images/flight_map.png)
![alt text](https://github.com/usfviz/Starrynight-/blob/master/images/probability_flight_delay.png)

![alt text](https://github.com/usfviz/Starrynight-/blob/master/images/word_cloud.png)

![alt text](https://github.com/usfviz/Starrynight-/blob/master/images/network_plot.png)
![alt text](https://github.com/usfviz/Starrynight-/blob/master/images/clustering_plot.png)

[Data Set](https://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On-Time)
----------------

This database contains scheduled and actual departure and arrival times reported by certified U.S. air carriers that account for at least one percent of domestic scheduled passenger revenues. The data is collected by the Office of Airline Information, Bureau of Transportation Statistics (BTS).








