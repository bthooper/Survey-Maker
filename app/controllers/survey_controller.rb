class SurveyController < ApplicationController

  get '/surveys' do
    if @user = current_user
      @my_surveys = @user.surveys.all
      @all_surveys = Survey.all
      erb :'surveys/index'
    end
  end

  get '/surveys/new' do
    if @user = current_user
      erb :'surveys/new'
    end
  end

  get "/surveys/:id" do
    @survey = Survey.find(params[:id])
    if current_user == @survey.user
      erb :"surveys/show"
    else
      redirect '/surveys'
    end
  end

  patch "/surveys/:id" do
    if @user = current_user
      @survey = Survey.find(params[:id])
      @new_data = params[:survey]
      @survey.name = @new_data[:name]
      @survey.description = @new_data[:description]
      @survey.questions.clear
      @new_data[:questions].each do |question|
        @new_question = @survey.questions.build(text: question[:question])
        question[:answers].each do |answer|
          @new_question.answers.build(text: answer[:answer])
        end
      end
      @survey.save
      redirect "surveys/#{@survey[:id]}"
    else
      redirect '/'
    end
    
  end


  post '/surveys' do
    if @user = current_user
      @survey = params[:survey]
      @new_survey = @user.surveys.build(name: @survey[:name], description: @survey[:description])
      @survey[:questions].each do |question|
        @new_question = @new_survey.questions.build(text: question[:question])
        question[:answers].each do |answer|
          @new_question.answers.build(text: answer[:answer])
        end
      end

      @new_survey.save 
      redirect :"surveys/#{@new_survey.id}"
    else
      redirect '/'
    end
  end
  
  get '/surveys/:id/edit' do
    if @user = current_user
      @survey = Survey.find(params[:id])
      erb :"/surveys/edit"
    else
      redirect '/'
    end
  end
  
  delete "/surveys/:id/delete" do
    if @user = current_user
      @survey = Survey.find(params[:id])
      @survey.questions.each do |question|
        question.answers.each do |answer|
          answer.destroy
        end
        question.destroy
      end
      @survey.destroy
      redirect '/surveys'
    else 
      redirect '/'
    end
  end




end


