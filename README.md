# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Ruby version -> 2.7.1
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

# Models Generation Command
- rails g model productProspect status:integer name:string position:string country:string store:string --no-test-framework
- rails g model product product_prospect:references name:string 'price:decimal{5,3}' --no-test-framework
- rails g model country name:string --no-test-framework
- rails g model store country:references name:string --no-test-framework
- rails g model productStore product:references store:references --no-test-framework

# Controller Generation Command
- rails g controller api/v1/productProspects --no-helper --no-assets
- rails g controller api/v1/products --no-helper --no-assets
- rails g controller api/v1/stores --no-helper --no-assets
- rails g controller api/v1/countries --no-helper --no-assets

# Q&A
* Why the table/model productProspect doesn't have country & store as foreign key(FK)?
- We need to be able to receive thousands of request and it's faster not to have a defined relationship. Also the bussiness flow will check if the store/country exists with some API(Google Maps u other).