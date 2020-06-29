Specifications for the Sinatra Assessment
Specs:

 X Use Sinatra to build the app --- Used Sinatra to connect MVCs
 X Use ActiveRecord for storing information in a database 
 X Include more than one model class (e.g. User, Post, Category) --- Three class models: User, Book, and Genre
 X Include at least one has_many relationship on your User model (e.g. User has_many Posts) --- User has_many books, genre has_many books
 X Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) --- book belongs_to user, book belongs_to genre
 X Include user accounts with unique login attribute (username or email) --- created through the users controller and the login/signup/logout erb files
 X Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --- books can be created, read, updated, and destroted by uniue users
 X Ensure that users can't modify content created by other users --- user must == cuttent_user in order to edit or delete a book
 X Include user input validations --- included on class form and signup
 X BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) --- not done, but plan to do
 X Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code --- see README.md
X Confirm --- confirm

 X You have a large number of small Git commits --- i do, generally.
 X Your commit messages are meaningful --- they are, generally.
 X You made the changes in a commit that relate to the commit message --- i did, generally.
 X You don't include changes in a commit that aren't related to the commit message --- i didn't, generally.