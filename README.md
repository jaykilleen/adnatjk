# Adnat (Ruby on Rails challenge)

This application is my attempt at completing the [Adnat (backend)](https://github.com/TandaHQ/work-samples/tree/master/adnat%20(backend)) challenge by TandaHQ.

After cloning this repository, please ensure you have the following dependencies to allow you to progress through the build steps:

## System dependencies  

**ruby 2.6.3**  
**rails 6.0.2.1**  
**postgresql 9.5**  
**foreman 0.82.0**  

`gem install foreman -v 0.82.0`

## Configuration  

If this is your first time installing Ruby or Ruby on Rails then please follow [Chris from Gorails' excellent guide](https://gorails.com/setup/ubuntu/18.04).

After cloning, and validating your dependcies please follow these steps:
`bundle install`
`yarn install --check-files`

Delete the `credentials.yml.enc` file/  
Regenerate a new `credentials.yml.enc` and `master.key` by running the command `EDITOR=vim rails credentials:edit`  

## Database creation and seeding

You should now be ready to create your database, migrate the tables and seed with seed data.
The `database.yml` has been setup to use your default `postgres` username and password.

`rails db:setup`

## How to run the test suite  

Please validate that the existing application is functioning correctly by running the test suite.

`bundle exec rspec spec .`

## Services (job queues, cache servers, search engines, etc.)  

Use foreman to run the Procfile.dex which will start the rails server and webpacker.

`foreman start -f Procfile.dev`

## Deployment instructions  

_This application has not been configured for deployment_

Once the rails server is running please visit [localhost:3000](http://localhost:3000) to interact with Adnat!

If you get an error like `rails Webpacker can't find application` then you may need to re-run `yarn`.  
