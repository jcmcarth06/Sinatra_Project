require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :method_override, true
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bookclub_secret"
  end

  not_found do
    status 404
    erb :error
  end

  get '/' do
    if logged_in? 
      redirect to '/books'
    else
      erb :index
    end
  end

  helpers do
    
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

  private

    def verify_logged_in
      if !logged_in?
          redirect to "/login"
      end
    end
  

end
