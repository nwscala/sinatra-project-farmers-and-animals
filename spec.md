# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database (db/migrate)
- [x] Include more than one model class (e.g. User, Post, Category) (app/models Farmer, Animal, Farmer_Animal)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (Farmer has_many Farmer_Animals)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Farmer_Animals belongs_to Animal)
- [x] Include user accounts with unique login attribute (username or email) (Farmer /farmers/login and /farmers/new methods)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (Farmer can create through /farmers/new, read through /farmers/:slug, update through patching to /farmers/:slug, and deleting through a delete action on /farmers/:slug)
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message