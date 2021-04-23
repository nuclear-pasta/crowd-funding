In order to install the app run the following commands:

- `bundle install`
- `rails db:create db:migrate db:seed`
- `rails s -p 3000`
  The routes for the api are:

POST /api/v1/campaigns/:id/create_investment
GET /api/v1/campaigns
GET /api/v1/campaigns/:id

They can be tested though Postman
run `rspec spec` in order to run tests
