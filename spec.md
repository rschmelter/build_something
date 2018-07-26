Specifications for the Rails Assessment
Specs:

 [x]Using Ruby on Rails for the project

 [x]Include at least one has_many relationship (x has_many y e.g. [ [ ]]User has_many Recipes) 
 (A User has many projects. Project and Material have a bi-directional has many through relationship with ProjectMaterial as a join table)

 [x]Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) 
 (A project belongs to a user. ProjectMaterial belongs to a Material and a project)

 [x]Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) 
 (Project and Material have a bi directional has many through relatonship with ProjectMaterial as a join table)

 [x]The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) 
 (ProjectMaterial is a join table that has both size and quantity attributes that can be submitted by the user)

 [x]Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) 
 (Validations are included on the User to ensure uniqueness and presence of required fields. The Project model has validations to ensure the presence of required fields and that the right type of data is being submitted)

 [x]Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) (The Project model has class scope methods for ordering objects on the project index page. The ProjectMaterial model has a class scope method for determining the most commonly used material)

 [x]Include signup (how e.g. Devise) 
 (Signup can be completed through Github using Omniauth gem. There is also custom logic for signing up for an account and authentication using bcrypt and has_secure_password)

 [x]Include login (how e.g. Devise) 
 (Custom login logic is used to initiate a session in User Model and controller and application controller)

 [x]Include logout 
 (Custom logic is used to clear the session and return the user to the login page)

 [x]Include third party signup/login (how e.g. Devise/OmniAuth)(how e.g. Devise) 
 (Third party signup is available through Github using the Omniauth gem)

 [x]Include nested resource show or index (URL e.g. users/2/recipes) 
 (Projects are nested under Uers. User can navigate to user/:id/projects/:id)

 [x]Include nested resource "new" form (URL e.g. recipes/1/ingredients) 
 (A user creates a new project through a nested resource  user/:id/projects/new)

 [x]Include form display of validation errors (form URL e.g. /recipes/new)
  (Logic is used in form views to display errors and fields_with_errors wraps fields submitted with invalid data. The form is rendered to maintain data that the user attempted to submit)


Confirm:

 [x]The application is pretty DRY
 [x]Limited logic in controllers
 [x]Views use helper methods if appropriate
 [x]Views use partials if appropriate