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
        sliderInput("num_runs", "Number of simualtion runs", 1, 10, 3, 1, TRUE),
        sliderInput("warm_up_time", "Warm up time (hours)", 8, 24, 24, 1, TRUE),
        sliderInput("pt_time_in_sim", "Patient time in simulation (hours)", 24, 96, 96, 2, TRUE),
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

  })
}

## To be copied in the UI
# mod_des_ui("des_1")

## To be copied in the server
# mod_des_server("des_1")
