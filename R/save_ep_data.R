save_ep_data <- function(season){
  
  ep_object <- ffexpectedpoints::ep_build(season)
  
  # rds
  saveRDS(ep_object$ep_weekly, glue::glue('data/weekly/ep_weekly_{season}.rds'))
  saveRDS(ep_object$ep_pbp_rush, glue::glue('data/pbp/ep_pbp_rush_{season}.rds'))
  saveRDS(ep_object$ep_pbp_pass, glue::glue('data/pbp/ep_pbp_pass_{season}.rds'))
  
  # csv
  readr::write_csv(ep_object$ep_weekly, path = glue::glue('data/weekly/ep_weekly_{season}.csv'))
  readr::write_csv(ep_object$ep_pbp_rush, path = glue::glue('data/pbp/ep_pbp_rush_{season}.csv'))
  readr::write_csv(ep_object$ep_pbp_pass, path = glue::glue('data/pbp/ep_pbp_pass_{season}.csv'))
  
  # .parquet
  arrow::write_parquet(ep_object$ep_weekly, glue::glue('data/weekly/ep_weekly_{season}.parquet'))
  arrow::write_parquet(ep_object$ep_pbp_rush, glue::glue('data/pbp/ep_pbp_rush_{season}.parquet'))
  arrow::write_parquet(ep_object$ep_pbp_pass, glue::glue('data/pbp/ep_pbp_pass_{season}.parquet'))
  
  cli::cli_alert_success("Saved {season} weekly and pbp data.")
  
return(invisible())
}

# purrr::walk(.x = 2018:2021, .f = ~save_ep_data(season = .x))
