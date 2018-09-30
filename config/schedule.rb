
set :output, "/tmp/cron_log.log"

 every 1.hour do
   rake "pull_api_service_data:pull_data"
 end
