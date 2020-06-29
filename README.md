Sinatra Project 

Welcome to The Book Club! Use this website to create a database of books to be shared and read by a group of individual contributors. Users can create, edit, and delete books upon completion, and their entries are only alterable by themselves.
Each book entry includes specific information, including the Title, Author, Genre, and a short Blurb about the content of the book.

Installation
To install this program, clone the repository from https://github.com/jcmcarth06/Sinatra_Project, then run 'bundle install' in the terminal.

Usage
The user must first create a signup profile that includes a unique email, username, and password. From the signup page, the user wil be automatically be routed to the book list index. On other log in instances, the user will start at the login page. If they enter invalid credentials, they will be redirected to the signup page to create some, which will send them down that same route. From the index page, the user can see a list of all of the books they and other users have added. They can view specific details about each book, including title, author, genre, and a blurb, by clicking on the title. They will also be able to add a new book to the database from the index page which includes all of the aforementioned attributes. When a user is on the view page, they have the option to edit or delete a book from the database, but will only be able to update or delete an instance that they created. At the bottom of each page is a home feature, which routes the user to the book list index, and a log out feature, which logs the user out of that session.

Development
After checking out the repo, run bin/setup to install dependencies. You can also run bin/console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and tags, and push the .gem file to rubygems.org.

Contributing
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

License
The gem is available as open source under the terms of the MIT License.

Code of Conduct
Everyone interacting in the CLIProject project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.