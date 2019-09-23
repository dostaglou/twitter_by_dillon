# README

Twitter: By Dillon

This site was a test of capabilities using Ruby on Rails, Graphql (pending) and Vue.js (pending). it was built in a mere 7 days (55ish hours so far).

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


### Installing

You will need to clone the repo and bundle install.
```
$ bundle install
```

After that is complete, you will need to migrate the database.

```
$ rails db:migrate
```


(note to self: flesh out seeds - develop tests - mention here)


You can now run the app locally with

```
$ rails s
```

Open up your browser to http://localhost:3000

You will see a simple landing page with sign_in/up options. Click on sign_up. Enter a unique Username, simple password, an email address, and click to confirm.

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


Possible activities:

Generate a tweet.
Follow another user (if you geneate another and navigate to them - user index not yet built)
Unfollow another user (same caveat)
Edit your profile information.
Toggle twitter feed to display tweets from those you follow, all others, your own

More features to come in the next few days.
