#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(dplyr)
library(readr)
read_csv("AppDetails2.csv")->table
table[,1:4]->table
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("EcoEvo Info Check"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            textInput("surname",
                        "Last name:",
                        value="",
                      placeholder="xxxxxxx")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          tableOutput("infoTable")
           #plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$infoTable<-renderTable(table%>%subset(LastName==input$surname))

    # output$distPlot <- renderPlot({
    #     # generate bins based on input$bins from ui.R
    #     x    <- faithful[, 2]
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    # 
    #     # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'darkgray', border = 'white',
    #          xlab = 'Waiting time to next eruption (in mins)',
    #          main = 'Histogram of waiting times')
    # })
}

# Run the application 
shinyApp(ui = ui, server = server)
