
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

 every 60.minutes do
   rake "pull_api_service_data:pull_data"
   command "echo 'Local DB updated'"
 end
