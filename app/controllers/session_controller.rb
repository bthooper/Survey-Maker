class SessionController < ApplicationController 
  
  get '/login' do
    if !logged_in? 
      erb :'sessions/login'
    else
      @user = User.find_by(email: session[:email])
      redirect :'/'
    end
  end

  get '/registration' do
    if !logged_in?
      erb :'sessions/registration'
    else
      @user = User.find_by(email: session[:email])
      redirect :'/'
    end
  end

  post '/registration' do
    if !logged_in?
      @user = User.new(username: params[:username], firstname: params[:firstname], lastname: params[:lastname], password: params[:password], email: params[:email])
      @user.save
      session[:email] = params[:email]
      erb :'surveys/index'
    else
      redirect '/'
    end
  end

  post '/sessions' do
    login(params[:email], params[:password])
    erb :'surveys/index'
  end

  get '/logout' do
    session.clear
    redirect :'/'
  end

end
