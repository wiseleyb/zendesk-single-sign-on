# Zendesk single sign on example

This is a very basic Rails app to test Zendesk's single sign on.

## Setup

* git clone https://github.com/wiseleyb/zendesk-single-sign-on
* bundle
* be rake db:create db:migrate db:seed db:test:prepare

## To host on Heroku
Since Zendesk single sign requires a live url it's easiest to play around with this on Heroku.

* gem install heroku
* heroku login
* heroku create (not the url it gives you)
* make sure you've add ~/.ssh/id_rsa.pub to your authorized keys on your heroku account
* git push heroku master
* heroku run rake db:migrate
* heroku run rake db:seed
* you should now be able to go to the url and login with admin / 1234
* change your admin password

## Set your Zendesk EVN variables
* heroku config:set ZENDESK_SHARED_SECRET= ...
* heroku config:set ZENDESK_SUBDOMAIN= ...
* also set these in your .bash_profile, reload bash_profile, restart rails - this still won't work in dev but it won't crash
* export ZENDESK_SHARED_SECRET="..."
* export ZENDESK_SUBDOMAIN="..."

## Run the site
* bundle exec rails s
* login: admin 1234
* go to localhost:3000 - note - none of the zendesk stuff will work in dev

## Set up your settings on Zendesk

![Zendesk settings](http://imgur.com/uxpMM9k.png)

## Troubles?

You can tail the logs on Heroku with `heroku logs`

Or you can login to console: `heroku run bash` then `bundle exec rails c`
