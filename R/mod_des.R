#' des UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_des_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title="111 Demand modelling"),
      shinydashboard::dashboardSidebar(
        h2('Configuration', class = "sidebar-h2"),
        # Note the ns() which is required when using modules
        # Otherwise it does not prefix the module id to the id and doesn't work!
        sliderInput(ns("num_runs"), "Number of simualtion runs", 1, 10, 3, 1, TRUE),
        sliderInput(ns("warm_up_time"), "Warm up time (hours)", 8, 24, 24, 1, TRUE),
        sliderInput(ns("pt_time_in_sim"), "Patient time in simulation (hours)", 24, 96, 96, 2, TRUE),
        actionButton(ns('runsim'), 'Run Simulation'),
        collapsed = FALSE
      ),
      shinydashboard::dashboardBody(
        # infoBoxes
        fluidRow(
          shinydashboard::infoBox(
            "Orders", uiOutput("orderNum2"), "Subtitle", icon = icon("credit-card")
          ),
          shinydashboard::infoBox(
            "Approval Rating", "60%", icon = icon("chart-line"), color = "green",
            fill = TRUE
          ),
          shinydashboard::infoBox(
            "Progress", uiOutput("progress2"), icon = icon("users"), color = "purple"
          )
        ),
      )
    )
  )
}

#' des Server Functions
#'
#' @noRd
mod_des_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$runsim, {
      # options( "golem.app.prod" = FALSE)
      # golem::cat_dev("Run the simulation")

      session$sendCustomMessage(type = 'testmessage', message = list(input$num_runs, input$warm_up_time, input$pt_time_in_sim))
      write_variables(input$num_runs, input$warm_up_time, input$pt_time_in_sim)
    })
  })
}

## To be copied in the UI
# mod_des_ui("des_1")

## To be copied in the server
# mod_des_server("des_1")
