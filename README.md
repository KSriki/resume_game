# Running resume game

Resume game is a proof of concept project for formatting resumes in a webpage using standard CSS templates.

* Ruby version: 2.3.3

* Database initialization

- Run the console command `rake db:setup` to create the database and populate it with seed data before use. Failure to seed data will result in absent dropdown forms during resume creation `/users/:id/resume_form`

* How to run the test suite

- Run the console command `spec _____`

# User Specs

- Existing user is able to login
- New user is able to create an account
- Homepage renders with a nav bar and footer if user has already logged in during their current session
- Loading the resume form page renders the form with the correct fields
- Submitting the resume form page creates new objects or relationships with existing objects
- Loading the resume edit page renders the form with the existing information
- Clicking the links on the nav-container bar navigates the correct page
- Users who try to access any page other than the homepage, login page, or sign up page without being logged in will be  redirected to the login page
- The analytics page lists info using related analytics methods
- The about page shows static info about the project
