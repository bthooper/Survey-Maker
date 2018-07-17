require 'rack-flash'


class ApplicationController < Sinatra::Base

  
  configure do 
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions
    set :session_secret, 'abracadabra'
    use Rack::Flash
  end

  get '/' do
    if !logged_in?
      erb :'index'
    else 
      @user = User.find_by(email: session[:email])
      erb :'index'
    end
  end

  helpers do 

    def logged_in?
      !!session[:email]
    end

    def login(email, password)
      user = User.find_by(email: email)
      if user && user.authenticate(password)
       session[:email] = user.email
       session[:user_name] = user.firstname + ' ' + user.lastname
     else
       redirect '/login'
     end
    end

    def current_user
      if logged_in?
        User.find_by(email: session[:email])
      else
        redirect '/' 
      end
    end
  
  end

end
