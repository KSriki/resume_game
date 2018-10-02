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

rails g resource user username:string fullname:string password_digest:string --skip-routes --no-javascripts 

rails g resource education start_date:date end_date:date institution_id:integer --skip-routes --no-javascripts

rails g resource institution name:string --skip-routes --no-javascripts

rails g resource position title:string description:text start_date:date end_date:date user_id:integer company_id:integer --skip-routes --no-javascripts

rails g resource company name:string size:string sector:string --skip-routes --no-javascripts

rails g resource industry field:string --skip-routes --no-javascripts
