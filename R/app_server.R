#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  # reticulate::use_condaenv("base")
  # reticulate::py_run_file('D:/oneoneone/oneoneone-des.py')
  # Can't get reticulate to place nicely with the SimPy installation in another folder
  # Instead, we'll create a lookup ? CSV and then run the command below
  # Once it has completed, we can retrieve the output
  system("D:/conda/condabin/conda.bat activate base && D:/conda/condabin/conda.bat run D:/oneoneone/oneoneone-des.py", intern = T)

  mod_des_server("des_1")
}
