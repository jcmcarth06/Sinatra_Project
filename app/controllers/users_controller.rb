class UsersController < ApplicationController

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end
  
    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to '/books'
        end
    end
  
    post '/signup' do
        if params[:name] == "" || params[:email] == "" || params[:password] == ""
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
        binding.pry
        user = User.find_by(params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            erb :'books/index'
        else
            redirect to '/signup'
        end
    end
    
    get '/logout' do
        session.destroy
        redirect to '/'
        end
    end
  
  end