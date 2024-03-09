# deployed to shinyapps.io (https://www.shinyapps.io)
# you used to rsconnect to deploy
# to redeploy run: deployApp()
# url: https://camerkay.shinyapps.io/fics_app/

# load packages
library(shiny)
library(shinydashboard)
library(fics)

# define UI
ui <- dashboardPage(
  skin = "black",
  dashboardHeader(title = "FICS"),
  dashboardSidebar(
    textInput("input_string", "Enter a topic:", ""),
    actionButton("submit_button", "Create items")
  ),
  dashboardBody(
#      tags$head(tags$style(HTML('
#       .skin-blue .main-header .logo {
#         color: #000000;
#         background-color: #ffffff;
#       }
#       .skin-blue .main-header .navbar {
#         color: #000000;
#         background-color: #ffffff;
#       }
#       .skin-blue .main-header .logo:hover {
#         color: #000000;
#         background-color: #ffffff;
#       }
#       .skin-blue .main-header .navbar .sidebar-toggle {
#         color: #000000;
#         background-color: #ffffff;
# }
# .skin-blue .main-header .navbar .sidebar-toggle:hover {
#         color: #000000;
#         background-color: #ffffff;
# }
# .skin-blue .left-side, .skin-blue .main-sidebar, .skin-blue .wrapper {
#     background-color: #dddddd;
# }
#     '))),
    box(
      title = "Items",
      solidHeader = TRUE,
      htmlOutput("result_text")
    ),
    box(
      title = "Flexible Inventory of Conspiracy Suspicions App",
      solidHeader = TRUE,
      htmlOutput("description_text")
    )
  )
)

# define server
server <- function(input, output) {
  observeEvent(input$submit_button, {
    input_string <- input$input_string
    result <- paste0(1:17, ". ", fics(input_string), "<br>")
    output$result_text <- renderText({
      result
    })
  })
    output$description_text <- renderText({
      "<p><b>Description</b><br>This app uses the <a href='https://github.com/camkay/fics'>{fics}</a> package to create conspiracy theory items on a specified topic. The items are based on the Flexible Inventory of Conspiracy Suspicions (FICS) template (Wood, 2017).<br><br><b>Instructions</b><br>(1) Enter in a topic in the textbox.<br>(2) Click `Create Items`.<br>(3) See your new conspiracy theory items appear!<br><br><b>References</b> <br> Wood, M. J. (2017). Conspiracy suspicions as a proxy for beliefs in conspiracy theories: Implications for theory and measurement. British Journal of Psychology, 108(3), 507–527. https://doi.org/10.1111/bjop.12231</p>"
    })
}

# run the application
shinyApp(ui = ui, server = server)
