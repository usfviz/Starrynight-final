require(shiny)
require(scatterD3)

# Carrior delay
carrier_delay <- read.csv("prob_delay.csv")
carrier_delay$carrier <- as.character(carrier_delay$carrier)

fluidPage(
  conditionalPanel(
    'input.dataset === "Flight Table"',
    headerPanel('Flight Table of the United States'),
    sidebarPanel(
      checkboxGroupInput('show_vars', 'Columns in Flights to show:',
                         names(origin_dest_agg),
                         selected = names(origin_dest_agg))
    )
  ),
  conditionalPanel(
    'input.dataset === "Airport Map"',
    headerPanel('Flight Route by the selected departing airport'),
    sidebarPanel(
      selectInput("airport_name", "Airport:", 
                  choices=c('JFK','SFO','ATL','ORD','LAX','DFW','CLT','LAS','PHX','MIA','SEA')),
      helpText("Please Select an Airport by Flight Origin")
    )
  ),
  conditionalPanel(
    'input.dataset === "Scatter Plot"',
    headerPanel('Probability of the Flight Delay by departure hour (24hr)'),
    sidebarPanel(
      selectInput("show_vars3", "Flight Carriers:", multiple = TRUE,
                    choices = sort(unique(carrier_delay$carrier)),
                    selected = c('Delta Air Lines', 'American Airlines')),
      helpText("Please Select a Flight Carrier")
    )
  ),
  conditionalPanel(
    'input.dataset === "WordMap"',
    headerPanel('Top Airports by the air traffic')
  ),
  conditionalPanel(
    'input.dataset === "Network Plot"',
    headerPanel('Flight connection by states')
  ),
  conditionalPanel(
    'input.dataset === "Dendro Network"',
    headerPanel('Hierarchy clustering by state on flight frequency')
  ),
  
  
  sidebarLayout(
    sidebarPanel(
      selectInput('show_vars2', 'Flight Origin by State:', multiple = TRUE,
                  choices = sort(unique(origin_dest_agg$dest_state)),
                  selected = c('CA', 'TX', 'NY'))
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel('Flight Table', DT::dataTableOutput('mytable1')),
        tabPanel('Airport Map',plotOutput('flight_info')),
        tabPanel('Scatter Plot', scatterD3Output("scatterPlot", height = "500px")),
        tabPanel('WordMap', plotOutput('WordMap', height = '680px')),
        tabPanel('Network Plot', forceNetworkOutput("NetworkPlot", height = "500px")),
        tabPanel("Dendro Network", dendroNetworkOutput("dendro", height = "700px"))
      )
    )
  )
)

