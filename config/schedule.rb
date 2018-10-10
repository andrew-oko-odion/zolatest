set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 50.minutes do
  runner "Country.update_db_with_api_data"
 end
