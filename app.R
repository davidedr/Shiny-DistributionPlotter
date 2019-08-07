#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Distribution plotter"),
   
   sidebarLayout(
      sidebarPanel(
        numericInput("num", label = h3("Number of samples"), value = 1),
        radioButtons("dist_type", label = "Distribution type", choices = c("Normal" = "1", "Uniform" = "2", "Cauchy" = "3", "Poisson" = "4"), selected = "1")
      ),
      
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
    # generate bins based on input$bins from ui.1R
    x <- switch(input$dist_type, "1" = rnorm(input$num), "2" = runif(input$num), "3" = rcauchy(input$num), "4" = rpois(n = input$num, lambda = 10))
    hist(x, col = 'darkgray', border = 'white')
      
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

