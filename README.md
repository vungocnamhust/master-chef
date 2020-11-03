# Master chef
The web application about recipes for cooking which was built on RoR framework. 

## Environment
* Ruby version
    - ruby 2.6.3p62 (2019-04-16 revision 67580) __[universal.x86_64-darwin19]__

* Rails version
    - Rails 6.0.3.3

* Database
    - SQLite3

## Features
* Login [x]
* Logout [x]
* Sign in [x]
* Remember user [x]
* CRUD recipe [x]
* Search recipes [x]
* Manage your recipes [x]

## Folder structure

```
├── assets
│   ├── config
│   │   └── manifest.js
│   ├── images
│   └── stylesheets
│       ├── application.scss
│       ├── custom.scss
│       ├── ingredient.scss
│       ├── recipes.scss
│       ├── scaffolds.scss
│       └── sessions.scss
├── channels
│   └── application_cable
│       ├── channel.rb
│       └── connection.rb
├── controllers
│   ├── application_controller.rb
│   ├── chefs_controller.rb
│   ├── concerns
│   ├── ingredient_controller.rb
│   ├── recipes_controller.rb
│   └── sessions_controller.rb
├── helpers
│   ├── application_helper.rb
│   ├── chefs_helper.rb
│   ├── ingredient_helper.rb
│   ├── recipes_helper.rb
│   └── sessions_helper.rb
├── javascript
│   ├── channels
│   │   ├── application.js
│   │   ├── consumer.js
│   │   └── index.js
│   ├── packs
│   │   ├── add_ingredient.js
│   │   ├── add_step.js
│   │   ├── application.js
│   │   └── remove_step.js
│   └── recipe
├── jobs
│   └── application_job.rb
├── mailers
│   └── application_mailer.rb
├── models
│   ├── application_record.rb
│   ├── chef.rb
│   ├── concerns
│   ├── ingredient.rb
│   ├── ingredient_recipe.rb
│   ├── recipe.rb
│   └── step.rb
└── views
    ├── chefs
    │   ├── _form.html.erb
    │   ├── index.html.erb
    │   ├── new.html.erb
    │   └── show.html.erb
    ├── ingredient
    │   └── destroy.html.erb
    ├── layouts
    │   ├── _footer.html.erb
    │   ├── _header.html.erb
    │   ├── _shim.html.erb
    │   ├── application.html.erb
    │   ├── mailer.html.erb
    │   └── mailer.text.erb
    ├── recipes
    │   ├── _form.html.erb
    │   ├── _recipe.json.jbuilder
    │   ├── edit.html.erb
    │   ├── index.html.erb
    │   ├── index.json.jbuilder
    │   ├── new.html.erb
    │   ├── show.html.erb
    │   └── show.json.jbuilder
    ├── sessions
    │   └── new.html.erb
    └── shared
        └── _error_messages.html.erb
```
        