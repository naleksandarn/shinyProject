library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Chicken Weights by Feed Type"),
  
  sidebarLayout(
    sidebarPanel(
      # Checkbox for selecting feed type
      checkboxGroupInput("feedType", label = h3("Select feed type:"), 
                         choices = levels(chickwts$feed),
                         selected = levels(chickwts$feed))    
    ),
    
    mainPanel(type="tabs",
      # Make 3 tabs
      tabsetPanel(
        
        # First for Instructions 
        tabPanel("Instructions", 
                p("Application is made for visualizing and summarizing ",
                code("chickwts"), "dataset."),
                p("This dataset comes from an experiment were ", 
                  em('"the effectiveness of various feed supplements on the 
                      growth rate of chickens was measured and compared"'),
                  "(from R Documentation). Dataset has two variables:", 
                  code("weight"), " - a numeric variable giving the chick
                  weight and",
                  code("feed"), " - a factor giving the feed type."),
                
                p("Tab named", strong("Plot "), 
                  "shows boxplot of chicken weights by feed type where different
                  feed types can be selected from checkbox on the left side."),
                
                p("Tab ", strong("Summary "), 
                  "presents summary statistics of chicken weights by feed type.
                  Here again one can use checkbox on the left side to choose 
                  from feed type variable")
                ),
        
                
        # Second for boxplot 
        tabPanel("Plot", plotOutput("boxplot")),
        # And third for summary statistics
        tabPanel("Summary", verbatimTextOutput("summary"))
      )  
    )
  )
  
))