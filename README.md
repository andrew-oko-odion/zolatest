# README

# Sample API Application
Api that agregates data from restcountries.eu and fixer.io 

API to help select potential new country markets by looking at population density and strong
currency. Combine country data available from https://restcountries.eu/ with currency
conversion rates from http://fixer.io/

## Ruby version
ruby '2.4.0'

## Installation (Set up Rails application)
Follow these easy steps to install and start the app:

### Fetch Gems 
First, install the gems required by the application:

	bundle

	Edit `config/database.yml` 
with username and password for you Postgresql database.

Next, execute the database migrations/schema setup:
	
	`bundle exec rake db:setup`
	
Next, from the root of you the application, update cron jobs with:
`whenever --update-crontab `

### Start the server
    `rails server`

	Pointing your browser 
[http://localhost:3000](http://localhost:3000) 
 
	You can find endpoint documentation  by pointing your browser to [http://localhost:3000/api_docs/swagger/](http://localhost:3000/api_docs/swagger/)
	
