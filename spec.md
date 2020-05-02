Specifications for the Sinatra Assessment
Specs:

[x] Use Sinatra to build the app: Application_Controller inherits from Sinatra::Base to provide #get, #post, #configure, and #set methods in controllers, which are used at least once in a controller each.

[x] Use ActiveRecord for storing information in a database: Use of #create, #update, #save, and #destroy methods inside of controllers are all examples of using ActiveRecord to store (edit, delete, etc) data in a database.

[x] Include more than one model class (e.g. User, Post, Category): Two model classes created and used - Song and User.

[x] Include at least one has_many relationship on your User model (e.g. User has_many Posts): User has_many :songs.

[x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): Song belongs_to :user.

[x] Include user accounts with unique login attribute (username or email): Upon signing up, the user/signup post controller checks for any matches (email or username) in database and redirects to signup if there are already existing users with that information.

[x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: Songs_Controller has "/songs/new" for creating, "/songs/:id" for reading, "/songs/:id/edit" for updating, and "songs/:id/delete" for deleting.

[x] Ensure that users can't modify content created by other users: Use of current_user.id == song.user.id to check if the current user is the creator of the song. If not, they don't even see the edit/delete options on the page.

[x] Include user input validations: I used the #authenticate method provided by the has_secure_password macro to validate the user's password upon login.

[] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)

[x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: All of these are included in the README.md file.

[x] Confirm

 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message