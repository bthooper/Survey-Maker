class SurveyController < ApplicationController

  get '/surveys' do
    if @user = current_user
      @surveys = @user.surveys.all
      erb :'surveys/index'
    end
  end

  get '/surveys/new' do
    if @user = current_user
      erb :'surveys/new'
    end
  end

  get "/surveys/:id" do
  end

  post '/surveys' do

  end
  
  
  get '/surveys/:id/edit' do
  end
  
  get '/surveys/:id/delete' do
  end







end


