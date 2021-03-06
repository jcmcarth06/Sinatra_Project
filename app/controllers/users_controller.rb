class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb :'users/signup'
        else
          redirect to '/books'
        end
      end

    post '/signup' do
        if params[:name] == "" || params[:email] == "" || params[:password] == ""|| User.find_by_name(params[:name])
            redirect to '/signup'
        else
            @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect to '/books'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to '/books'
        end
    end

    post '/login' do
        user = User.find_by_name(params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/books'
        else
            redirect to '/signup'
        end
    end
    
    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
  
  end