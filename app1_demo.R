# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("lumen"),
                  # different themes available at: https://rstudio.github.io/shinythemes/
    navbarPage(
      # App title displayed at the navigation bar:
      "QWG Shiny Demo App 1",
      # Defining tab panels and creating sidebar panels:
      tabPanel("Navbar 1",
          sidebarLayout( # specify the layout of your page
               sidebarPanel( # will accept the input
                 # Tag (h1-h4 are different sizes, in descending order):
                 tags$h3("Input:"),
                 # Widgets (text input below) see more at: https://shiny.rstudio.com/gallery/widget-gallery.html
                 textInput("txt_first", "Fist Name:", "Ipek"),
                 textInput("txt_last", "Last Name:", ""),
               ), # close sidebarPanel
               
               mainPanel( # displays the output
                            h1("Header 1"),
                            h2("Output 1"),
                            h3("Output 2"),
                            # Text box to display output value(text here):
                            verbatimTextOutput("txtout"),
               ) # close mainPanel
          ) # close sidebarLayout
      ), # close Navbar 1 tabPanel
      tabPanel("Navbar 2", "This tabPanel is left blank"),
      tabPanel("Navbar 3", "This tabPanel is left blank")
    ) # close navbarPage
  ) # close fluidPage

  
  # Define server function  
  server <- function(input, output) {
    # using renderText() to display the text:
    output$txtout <- renderText({
      paste( input$txt_first, input$txt_last, sep = " " )
    })
  } # close server
  
  # Create Shiny object
  shinyApp(ui = ui, server = server)
