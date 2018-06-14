require 'Sinatra'
require 'Sinatra/reloader' if development?
require_relative './controllers/records_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run RecordsController
