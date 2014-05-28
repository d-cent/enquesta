## Enquesta

_for just-in-time distributed decision making._

[![Build Status](https://travis-ci.org/d-cent/enquesta.png)](https://travis-ci.org/d-cent/enquesta)
[![Code Climate](https://codeclimate.com/github/d-cent/enquesta.png)](https://codeclimate.com/github/d-cent/enquesta)

## Get Started

```bash
bundle
bundle exec rake db:create
bundle exec rake db:schema:load
foreman start
```

(and visit [localhost:5000](http://localhost:5000))

## Test

I'm using [rspec](http://rspec.info/) to test the models and controllers. Contributors are asked to do the same.

```bash
bundle exec rake
```

## Deploy

Deploy it on [Heroku](http://heroku.com) in a few easy steps:

```bash
heroku create
git push heroku master
heroku run rake db:schema:load
rake secret | pbcopy
heroku config:set SECRET_KEY_BASE=[ cmd+v ] I18N_LOCALE=[en/es/de]
```
