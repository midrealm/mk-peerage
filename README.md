# README

To set up for front-end development

* cp config/database.sqlite.yml config/database.yml
* cp config/environments/development_sample.rb config/environments/development.rb 
* yarn install
* webpack
* bundle install
* bundle exec rake fake_data:all
* bundle exec rails s

then go to localhost:3000 in your browser

For actually doing development, you'll need to start the webpack with the watch flag 
and the rails server. You can do this by runnning in separte terminals:
* npm webpack:start
* bundle exec rails s

or you can run both at once. 
First:
$cp Procfile.dev_sample Procfile.dev

then and forevermore
foreman start -f Procfile.dev
