# README

Twitter: By Dillon

THis application / site was a test of my capabilities using Ruby on Rails, Graphql, and Vue.js (pending). It was built in a mere 7 days.

At current the backend and front-end use standard Ruby on Rails with jquery support. The app does expose a Graphql API that functions for all the basic needs: Signup, Login, View tweet(s), View User(s), (un)follow users, and digging into depth on those relations. The tweet-to-tweet reply feature is new and not yet supported on the graphql side.

A very basic instalation of vue exists but has been turned off. Needing to learn more about vue routing and storing/using token authentication has delayed this aspect and thus is not ready at this time.




## Getting Started

Built using:

Ruby 2.6.3

Rails 6.0.0

Sqlite3 1.4

All standard gems for Rails 6.0.0

Devise 4.7.1

Bootstrap-sass 3.4.1

Sassc-rails 2.1.0

Jquery-rails 4.3.5

Simple_form 4.1.0

Graphql 1.9.12

Graphiql-rails 1.7.0

Ancestry 3.0.7

### Installing

You will need to clone the repo and bundle install.
```
$ bundle install
```

After that is complete, you will need to migrate the database.

```
$ rails db:migrate
```

If you wish to have a pre-populated db for your user experience, you can seed the db using the existing file.

```
$ rails db:seed
```

While there should be no errors in the seeds, if any appear, please reset

```
$ rails db:reset
```

You can now run the app locally with

```
$ rails s
```

Open up your browser to http://localhost:3000

You will see a simple landing page with sign_in/up options. You may feel free to use one of the seeded accounts or sign up on your own.

The 1 static seeded account is

email: dillon@dillon.com
password: 123123

If you click on sign_up button, however, enter a unique Username, simple password, and an email address, and click to confirm. You may at this time also add a short bio.

Your terminal will show you a message akin to:

```
Devise::Mailer#confirmation_instructions: processed outbound mail in 6.4ms
Delivered mail 5d88f2f0a5fe7_6bcf2aac846744e4277c6@dillon-Aspire-A315-53.mail (2.3ms)
Date: Tue, 24 Sep 2019 01:29:36 +0900
From: support@dillonwyatt.dev
Reply-To: support@dillonwyatt.dev
To: bob@gmail.com
Message-ID: <5d88f2f0a5fe7_6bcf2aac846744e4277c6@dillon-Aspire-A315-53.mail>
Subject: Confirmation instructions
Mime-Version: 1.0
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

<p>Welcome bob@gmail.com!</p>

<p>You can confirm your account email through the link below:</p>

<p><a href="http://localhost:3000/users/confirmation?confirmation_token=icT88tuALwzojyuMrwWr">Confirm my account</a></p>

```

Please open the link at the bottom http://localhost:3000/users/confirmation?confirmation_token= //your token here//

That will direct you to a confirmation form to enter your email and password in again. After confirming you will be on your own twitter feed.


Possible activities with the vanila interface:

Generate a tweet.
Follow another user if you seeded or signed_up twice.
Unfollow another user
Edit your profile information.
Toggle twitter feed to display tweets from those you follow, all others, your own
Reply to a tweet and thus also see all other replies to that tweet.

A graphql api system has been set up as well. If you wish to explore this option, please go to http://localhost:3000/graphiql.

The interface on the right of the page will guide you as to the possible queries you can make but below I have also written a few.

Get all the tweets in the serve along with the user info who posted (id, name, bio, follower / following counts)

```
{
tweets{
      createdAt
      id
      content
      user{
        id
        username
        bio
        avatar
        followersCount
        followersCount
      }
    }
}
```

Create a new User (of note, you must provide a unique email address)

```
mutation{
  createUser(input:
  {
    username: "Bob"
    bio: "I am bob"
    avatar: null
    authProvider: {
      email: {
        email: "bob@bob.com"
        password: "123123"
      }
    }
  }){
    user{
      username
      bio
      id
    }
  }
}
```
Create a Follow relation for a user:

```
mutation {
  createFollow(input: {
    activeUser: 10,
    passiveUser: 11
  }) {
    active {
      id
      username
    }
    passive {
      id
      username
    }
  }
}
```
