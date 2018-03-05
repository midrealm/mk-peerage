# README

To set up for front-end development

* Make sure npm is installed.
* Install yarn globally
* Use yarn to install webpack globally 

```
$ cp config/database.sqlite.yml config/database.yml
$ yarn install
$ webpack --config webpack.dev.js
$ bundle install
$ bundle exec rake fake_data:all
```

You will want to set up the environment variables. Create a file in rails root called ".env" and save the following:
```
# .env
export RECAPTCHA_SITE_KEY  = '6LcQmCcTAAAAAPoEURxzZ0qeqSlIRoEc_03rF6aE'
export RECAPTCHA_SECRET_KEY = '6LcQmCcTAAAAAM1_iGi5tR00EDVd0Za-OJGmsebG'
export LAUREL_MAILING_LIST = 'laurel_list@mailinator.com'
export PELICAN_MAILING_LIST = 'pelican_list@mailinator.com'
```
then 
```
$ bundle exec rails s
```

then go to localhost:3000 in your browser

For actually doing development, you'll need to start the webpack with the watch flag
and the rails server. You can do this by runnning in separte terminals:
```
$ npm webpack:start
$ bundle exec rails s
```

or you can run both at once.
First:
```
$cp Procfile.dev_sample Procfile.dev
```
then and forevermore:
```
$ foreman start -f Procfile.dev
```
