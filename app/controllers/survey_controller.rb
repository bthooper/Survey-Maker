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
    erb :"surveys/show"
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
    end
  end
  
  
  get '/surveys/:id/edit' do
  end
  
  get '/surveys/:id/delete' do
  end







end


