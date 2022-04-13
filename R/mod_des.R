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
    h2('HELLO')
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
