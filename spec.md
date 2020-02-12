# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database (db/migrate)
- [x] Include more than one model class (e.g. User, Post, Category) (app/models Farmer, Animal, Farmer_Animal)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (Farmer has_many Farmer_Animals)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Farmer_Animals belongs_to Animal)
- [x] Include user accounts with unique login attribute (username or email) (Farmer /farmers/login and /farmers/new methods)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Farmer can create through /farmers/new, read through /farmers/:slug, update through patching to /farmers/:slug, and deleting through a delete action on /farmers/:slug)
- [x] Ensure that users can't modify content created by other users(All edit functions are behind a check for logged_in? and that the id of the object being edited matches that of the current user)
- [x] Include user input validations (user input fields check to make sure that anything was typed in them i.e. farmers_controller.rb line 25)
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message