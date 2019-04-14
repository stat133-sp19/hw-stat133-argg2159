#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyr)

# Define the functions needed for the plot

#' @title future_value()
#' @description computes the future value of an account after a specified number of years given an initial amount and a rate of interest.
#' @param amount (numeric)
#' @param rate (numeric)
#' @param years (integer)
#' @return the computed amount in the account after years

future_value <- function(amount,rate,years){
    y <- amount*(1 + rate)^years
    return(y)
}


#' @title annuity()
#' @description computes the future annuity of an account when a regular deposit is made of a specified ammount, at a specific rate of interest, after a specified number of years 
#' @param contrib (numeric)
#' @param rate (numeric)
#' @param years (numeric)
#' @return the computed value in the account.

annuity <- function(contrib, rate, years){
    contrib*((1 + rate)^years - 1)/rate
}

#' @title growing_annuity()
#' @description Comuputes the future value of a growing annuity given the a rate of interest, number of years, initial contribution, and anual contribution. 
#' @param contrib (numeric)
#' @param rate (numeric)
#' @param growth (numeric)
#' @param years (numeric)
#' @return the amount in the account after the specified number of years.

growing_annuity <- function(contrib, rate, growth, years){
    y <- contrib*( (1 + rate)^years - (1 + growth)^years )/(rate - growth)
    return(y)
}



# Define UI
ui <- fluidPage(

    # Application title
    titlePanel("Workout 02"),
    
    hr(),
    
    # 2X3 widgets
    fluidRow(
        column(4, 
            sliderInput(
                inputId = "init",
                label = "Initial Amount (in $)",
                min = 0,
                max = 100000,
                step = 500,
                value = 1000),
            
            sliderInput(
                inputId = "contrib",
                label = "Annual Contribution (in $)",
                min = 0,
                max = 50000,
                step = 500,
                value = 2000)
            ),
        
        column(4,
            sliderInput(
                inputId = "rate",
                label = "Return Rate (in %)",
                min = 0,
                max = 20,
                step = .1,
                value = 5),
            
            sliderInput(
                inputId = "growth",
                label = "Growth Rate (in %)",
                min = 0,
                max = 20,
                step = .1,
                value = 2)
            ),
        
        column(4, 
            sliderInput(
                inputId = "year",
                label = "Years",
                min = 0,
                max = 50,
                step = 1,
                value = 10),
            
            selectInput(
                inputId = "facet",
                label = "Facet?",
                choices = c("yes", "no"),
                selected = "no"))
        ),
    hr(),
    h4("Timelines"),
    fluidRow(
        column(12,
            plotOutput("plot")
        )   
    ),
    hr(),
    h4("Balances"),
    fluidRow(
        column(12,
            dataTableOutput("data"))
    )
       
)

# Define server
server <- function(input, output) {

    # Create the Data frame for the plot and table
    modalities <- reactive({
        years <- input$year
        year <- 0:years
        no_contrib <- rep(0,years + 1)
        fixed_contrib <- rep(0,years + 1)
        growing_contrib <- rep(0,years + 1)
        contrib <- input$contrib
        rate <- input$rate/100
        growth <- input$growth/100
        
        #for loop
        for (i in year){
            no_contrib[i + 1] <- future_value(amount = input$init, rate = rate, years = i)
            fixed_contrib[i + 1] <- no_contrib[i + 1] + annuity(contrib = contrib, rate = rate, years = i)
            growing_contrib[i + 1] <- no_contrib[i + 1] + growing_annuity(contrib = contrib, rate = rate, growth = growth, years = i)
        }
        
        #Display as Data Frame
        data.frame(year, no_contrib, fixed_contrib, growing_contrib, row.names = NULL)
        
    # Create the Table    
    })
    output$data <- renderDataTable({
        
        modalities()
        
    })
    
    # Create the Plot
    output$plot <- renderPlot({
        
        if (input$rate == input$growth){
            stop("Return Rate cannot be the same as Growth Rate")
        }
        #Tidy Data
        modalities <- modalities() %>% gather(type, value, -year)
        
        #Generate basic plot
        gg <- ggplot(data = modalities, aes(x = year, y = value)) + 
            scale_color_discrete("Modalities") + 
            labs(title = "Three Modes of investing") + 
            xlab("Years") + 
            ylab("Account Balance") + 
            geom_line(aes(color = type)) + 
            geom_point(aes(color = type), size = 2)
        
        #Determine if it should be facited
        if (input$facet == "yes"){
            gg <- gg + 
                geom_area(aes(fill = type), alpha = .2) +
                facet_wrap(~type) + 
                guides(fill = FALSE)
                
        }
        
        gg
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
