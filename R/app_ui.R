#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title="111 Demand modelling"),
      shinydashboard::dashboardSidebar(
        h2('Configuration', class = "sidebar-h2"),
        sliderInput("num_runs", "Number of simualtion runs", 1, 10, 3, 1, TRUE),
        sliderInput("warm_up_time", "Warm up time (hours)", 8, 24, 24, 1, TRUE),
        sliderInput("pt_time_in_sim", "Patient time in simulation (hours)", 24, 96, 96, 2, TRUE)
      ),
      shinydashboard::dashboardBody(
        # infoBoxes
        fluidRow(
          shinydashboard::infoBox(
            "Orders", uiOutput("orderNum2"), "Subtitle", icon = icon("credit-card")
          ),
          shinydashboard::infoBox(
            "Approval Rating", "60%", icon = icon("line-chart"), color = "green",
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

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "oneoneoneR"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
