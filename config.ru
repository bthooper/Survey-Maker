require './config/environment'

use Rack::MethodOverride


use SessionController
use SurveyController
run ApplicationController

