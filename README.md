![Build Status](https://codeship.com/projects/7ff3c550-0688-0135-f11c-1e034e17b246/status?branch=master)
![Code Climate](https://codeclimate.com/github/oliviaruizknott/color_review.png)
![Coverage Status](https://coveralls.io/repos/oliviaruizknott/color_review/badge.png)

# color_coder

**color_coder** is a simple review web app that allows users to read about, post, and review colors entered by hex code. [You can see this code in use here.](http://colorcoder.herokuapp.com/) To run this code on your local machine:

```
$ git clone https://github.com/oliviaruizknott/color_review.git
$ cd color_review
$ bundle install
$ rake db:create && rake db:migrate && rake db:seed
$ rails server
```
In a separate terminal window:
```
$ npm install
$ npm start
```
To run the unit and feature testing, run `rake` in a new terminal window.

## Contributors
This project was made in fulfillment of the Group Project assignment at Launch Academy in the spring of 2017. Contributing group-mates were:
 - [Taylor Dorin](https://github.com/taylordorin)
 - [George Li](https://github.com/K9Advantix53)
 - [Olivia Ruiz-Knott](https://github.com/oliviaruizknott)
 - [Mike Silberstein](https://github.com/mikesilb)

## Heroku Link
Check out our app on Heroku! http://colorcoder.herokuapp.com/

## List of Features
This app allows visitors to the site to see and search all the colors and reviews stored in our database, as entered by themselves or other users. Visitors can sign up for an account which will allow them to post and edit colors, and post and edit and reviews of their own. Users designated as "Admins" have the added ability to delete colors, reviews, and users.

For a more complete list of features, see "User Stories & Acceptance Criteria" below.

## Technologies in this Project
This project is built a **Ruby on Rails** framework which incorporates **React.js** components. It uses **Devise** for user authentication, **RSpec** and **Capybara** for testing, **Sass** for styling, and **PostgreSQL** for database management.

## User Stories & Acceptance Criteria
This section outlines some of user stories and acceptance criteria used to drive our development. For the purposes of these user stories, a **visitor** is an unauthenticated user (that is, a user who has not signed in); a **user** is an authenticated user (that is, a user who has signed up and signed in); and an **admin** is an authenticated user with admin privileges (that is, a user who has signed up, signed in, and been designated as an "admin").

```
As a visitor
I want to see a list of colors in the database
So I can know some what colors have been added
```
- I must see a list of colors on the home page
- I must see the color hex code
- I must see the color nickname (if present)

```
As a visitor
I want to view a color’s details
So I can read the reviews of the color
```
- I must see the color hex code
- I must see the color nickname (if present)
- I must be able to get to this page from the home page
- I must have a link back to the home page

```
As a visitor
I want to see all the reviews associated with a color
So I can know what people think about it
```
- I must see all reviews associated with color on the color show page
- I must see the rating of the review
- I must see the time the review was posted

```
As a visitor
I want to sign up for an account
So that I can add colors and post reviews
```
- I must see a link to sign up on the home page
- I must supply valid information
- I must be given error messages if I supply invalid information

```
As a user
I want to sign in
So I can post and access my colors and reviews
```
- I must see a link to sign in on the home page
- I must supply valid information
- I must be given error messages if I supply invalid information
- I must not see a link to sign in if I am already signed in

```
As a user
I want to sign out
So no one can post or edit posts in my name
```
- I must see a link to sign out on the home page
- I must not see "Logged in as ..." after signing out

```
As a user
I want to be able to add a color
So that I can wow everyone with my good taste
```
- I must be able to get to the "new color" form from a link on the home page
- I must be able to get back to the index page from the "new color" page
- I must enter the color hex code
- I may enter a color nickname
- If the color is already in the database, it must not be stored
- I should get the appropriate flash messages when successful or unsuccessful
- I must be redirected to the color show page on submit
- I must be logged in to have any of the previous functionality

```
As a user
I want to edit a color’s nickname
So that I can change my mind
```
- I must get to the edit form from a link on the color show page
- I must not edit the hex color
- I must be able to edit the nickname
- I must be able to remove the nickname
- I must be redirected to the color show page
- I must be logged in to have any of the previous functionality

```
As a user
I want to add a review to a color
So I can let people know what I think of it
```
- I must give it a rating between 1 and 5
- I must write the body of the review
- I must be redirected back to the color show page once review is submitted
- I must be logged in to have any of the previous functionality

```
As a user
I want to be able to edit a review
So that I can change my mind about a previous opinion or edit a mistake
```
- I must see an edit link on any review that I wrote
- I must see an edit link on reviews I did not write
- I must be taken to the "edit a review"
- I must be redirected back to the color reviews page when saved
- I must be shown the appropriate messages when successful or unsuccessful
- I must be logged in to have any of the previous functionality

```
As a user
I want to be able to delete a review
So that if I make an egregious error, I can just get rid of it
```
- I must be able to delete the review from a button on the "edit review" page
- I must be redirected to the color show page

```
As an admin
I want to view a list of users
So I can see how many people use my app
```
- I must be able to get to the user list from a link on the home page
- I must be able to get to the user list by visiting the /users path
- I must not be able to see the user list if I am not logged in as an admin

```
As an admin
I want to delete a color
So I can keep my database clean
```
- I must be able to delete any color from the home page
- I must be able to delete any color from the color’s show page
- I must not be able to delete any color if I am not logged in as an admin

```
As an admin
I want to delete a review
So I can remove inappropriate content
```
- I must delete any review from the color show page
- I must not be able to delete a review if I am not logged in as an admin

```
As an admin
I want to delete a users
So that I can get rid of jerks
```
- I must delete a user from the /users page
