# BookIT

An API for an appointment booking platform built with Ruby on Rails.

## Built With

- Ruby on Rails v6.0.3.4
- Devise
- JWT
- PostgreSQL

## Endpoints : /api/v1/

Method|End point | Public |Action
-----------|----------|--------------|------
POST | sign_up | True | Register a new user
POST | sign_in | True | Login a registered user
DELETE | log_out| False  | Logout a user
POST | doctors | False | Admin creates doctors
PATCH | doctors/:id | False | Admin edits doctor's details
DELETE | doctors/:id | False | Admin deletes doctor's details
GET | doctors | False | Fetch all doctors
GET | doctors/:id | False | Fetch a specific doctor
POST | appointments | False | Book an appointment
GET | appointments | False | Fetch appointments for a specific user
GET | appointments | False | Admin fetches all appointments  

## Deployment

[Backend APIs Live Link](https://bookit-doc-appointments-api.herokuapp.com/)

[Frontend Live Link](https://bookit-doc-appointments.netlify.app/)

## Getting Started

To get a copy up and running follow these simple example steps:-
- Clone `https://github.com/Mupa1/bookit-api` to your local machine.
- Run `bundle install` to install dependancies.
- Run `rails s` to to run the application in development mode.
- Use postman to test the endpoints.

## Automated Tests

 > bundle exec rspec

## Author

👤 **Mupa M'mbetsa Nzaphila**

- Github: [@mupa1](https://github.com/Mupa1)
- Twitter: [@mupa_mmbetsa](https://twitter.com/mupa_mmbetsa)
- Linkedin: [mupa-mmbetsa](https://www.linkedin.com/in/mupa-mmbetsa)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Mupa1/bookit-api/issues).

## Show your support

Give a ⭐️ if you like this project!
