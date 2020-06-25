require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #mounting controllers
run ApplicationController #inherit from application controller
use AuthorsController
use BooksController
use GenresController
use UsersController
