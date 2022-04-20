#' write_variables
#'
#' @description Function that creates a tibble from inputs and saves a csv file for import
#' @param num_runs Number of simulation runs
#' @param warm_up_time Number of hours simulation should run before data is collected
#' @param pt_time_in_sim Total number of hours a single patient will be simulated for
#' @return file_saved Boolean value to indicate inputs validated and file has been successfully
#'
#' @noRd

write_variables <- function(num_runs, warm_up_time, pt_time_in_sim) {
  options( "golem.app.prod" = FALSE)
  golem::cat_dev("Inside write_variables")

  # Check all values are numbers
  if(!any(!is.numeric(c(num_runs, warm_up_time, pt_time_in_sim)))) {
    return(FALSE)
  }

  # Check warm_up_time < pt_time_in_sim
  if(warm_up_time > pt_time_in_sim) {
    return(FALSE)
  }

  # tmp_file <- paste0(golem::get_golem_wd(), '/sim_vars.csv')
  #
  # # Delete tmp_file if it already exists
  # if(file.exists(tmp_file)) {
  #   cat_dev('Deleting sim_vars.csv')
  #   file.remove(tmp_file)
  # }


  #py_run_file('D:\\oneoneone/oneoneone-des.py')
  # reticulate::py_run_string(glue::glue("number_of_runs={num_runs}"))
  # kickoff()
  # golem::cat_print(py$number_of_runs)

  command = glue::glue("D:/conda/condabin/conda.bat activate base && D:/conda/condabin/conda.bat run D:/oneoneone/oneoneone-des.py -n {num_runs} -w {warm_up_time} -p {pt_time_in_sim}")
  golem::print_dev(command)

  res <- system(command, intern = T)
  # # golem::print_dev(res)
  options( "golem.app.prod" = FALSE)
  golem::cat_dev('After shell command run')
  golem::print_dev(res)


}
