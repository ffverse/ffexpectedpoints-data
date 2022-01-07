save_ep_data <- function(season){
  
  ep_object <- ffexpectedpoints::ep_build(season)
  
  # rds
  saveRDS(ep_object$weekly, glue::glue('data/weekly/ep_weekly_{season}.rds'))
  saveRDS(ep_object$pbp$rush_df, glue::glue('data/pbp/ep_pbp_rush_{season}.rds'))
  saveRDS(ep_object$pbp$pass_df, glue::glue('data/pbp/ep_pbp_pass_{season}.rds'))
  
  # csv
  readr::write_csv(ep_object$weekly, glue::glue('data/weekly/ep_weekly_{season}.csv'))
  readr::write_csv(ep_object$pbp$rush_df, glue::glue('data/pbp/ep_pbp_rush_{season}.csv'))
  readr::write_csv(ep_object$pbp$pass_df, glue::glue('data/pbp/ep_pbp_pass_{season}.csv'))
  
  # .parquet
  arrow::write_parquet(ep_object$weekly, glue::glue('data/weekly/ep_weekly_{season}.parquet'))
  arrow::write_parquet(ep_object$pbp$rush_df, glue::glue('data/pbp/ep_pbp_rush_{season}.parquet'))
  arrow::write_parquet(ep_object$pbp$pass_df, glue::glue('data/pbp/ep_pbp_pass_{season}.parquet'))
  
  cli::cli_alert_success("Saved {season} weekly and pbp data.")
  
return(invisible())
}
