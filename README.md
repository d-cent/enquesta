## Enquesta

_for just-in-time distributed decision making._

[![Build Status](https://travis-ci.org/d-cent/enquesta.png)](https://travis-ci.org/d-cent/enquesta)
[![Code Climate](https://codeclimate.com/github/d-cent/enquesta.png)](https://codeclimate.com/github/d-cent/enquesta)

## Get Started

This assumes you have Ruby, Postgres, and Bundler on your local system.

```bash
git clone https://github.com/d-cent/enquesta.git
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
heroku config:set SECRET_KEY_BASE=[ cmd+v ] I18N_LOCALE=[en/es/de/ga/fi]
```

Made some changes and pushed them to Github? Deploy them to Heroku:

```bash
git pull --rebase origin master
git push heroku master
```

## Usage

Open the root page (`/`) to create a poll. The prompt will be rendered with Markdown and will auto-link URLs (though it requires an `http://` or `www.`). Options are currently limited to 3 (though this limitation will be lifted forthwith), and blank options will be ignored.

Polls are not currently authenticated, but secured by a secret URL. However, this is not proper security and shouldn't be assumed to be safe from tampering or prying eyes.

Votes are limited to one-per-person via a hash of the visitor's IP and browser data. Again, this is good for trusted and closed groups, but it would be fairly trivial for a malicious actor to spoof.
