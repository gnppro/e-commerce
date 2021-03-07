# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```
sudo chown -R $USER .
docker-compose up --build
docker-compose run web bundle install

docker-compose run web rake db:migrate:reset

docker-compose run web rake db:migrate
docker-compose run web rake db:rollback
docker-compose run web rails g migration <enable_uuid>

docker-compose run web rails g model <NAME> <title>
docker-compose run web rails g controller <NAME> new create update edit destroy index show [options]

docker-compose run web rails g controller Products create update destroy index show

docker-compose run web rails generate scaffold Images src:string alt:string name:string
rails g migration enable_uuid
rails generate scaffold Products name:string title:string content:text

docker-compose run web rails d scaffold Images
docker-compose run web bundle exec rake app:routes
docker-compose run web rails routes
```
