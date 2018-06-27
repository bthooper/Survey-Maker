# Sinatra Project
### A simple sinatra app to manage surveys
## Configuration

The following gems will be installed:

*Gemfile.rb*
``` rb
source "https://rubygems.org"

gem 'sinatra'
gem 'activerecord', '4.2.5'
gem 'sinatra-activerecord'
gem 'rake'
gem 'thin'
gem 'require_all'
gem 'shotgun'
gem 'pry'
gem 'tux'
gem 'sqlite3'
gem 'bcrypt'

```
The enviornment.rb:

``` rb
require 'bundler/setup'
Bundler.require
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/sinatra_project.sqlite"
)

require_all 'app'
```

Initial migration for users table:

``` rb
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
    end
  end
end
```

Initial model for user.rb:

``` rb
class User < ActiveRecord::Base
  has_secure_password
end
```
