# MK-Peerage
live site http://peerage.midrealm.org

## To set up for front-end development

make sure node and yarn are at versions in package.json

I use nvm to install node, so to get node to the correct version 
```
nvm install [version]
```

for yarn: 
```
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version [version]
source .bashrc
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

For actually doing development, you'll need to start the webpack-dev-server
and the rails server. You can do this by runnning in separte terminals:
```
$ webpack-dev-server
$ bundle exec rails s
```

