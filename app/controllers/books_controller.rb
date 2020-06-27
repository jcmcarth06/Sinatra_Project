class BooksController < ApplicationController

    get '/books' do
        if logged_in?
            @books = Book.all
            erb :'books/index'
        else
            redirect to '/login'
        end
    end

    get '/books/new' do
        if logged_in?
            @genres = Genre.all
            erb :'books/new'
        else
            redirect to '/login'
        end
    end

    post '/books' do
        if logged_in?
            if params[:title] == "" || params[:author] == "" 
                redirect to "/books/new"
            else
                @book = current_user.books.build(title: params[:title], author: params[:author], genre_id: params[:genre_id], description: params[:description])
                if @book.save
                    erb :"books/show"
                    
                else
                    redirect to "/books/new"
                end
            end
        else
            redirect to "/login"
        end
    end

    get '/books/:id' do
        if logged_in?
            @book = Book.find_by_id(params[:id])
            erb :'books/view'
        else
            redirect to '/login'
        end
    end

    get '/books/:id/edit' do
        if logged_in?
            @book = Book.find_by_id(params[:id])
            if @book && @book.user == current_user  #only the user can edit their own book
                @genres = Genre.all
                erb :'books/edit'
            else
                redirect to "/books"
            end
        else
            redirect to '/login'
        end
    end

    patch '/books/:id' do
        if logged_in?
            if params[:title] == "" || params[:author] == ""
                redirect to "/books/#{params[:id]}/edit"
            else
                @book = Book.find_by_id(params[:id])
                if @book && @book.user == current_user
                    if @book.update(title: params[:title], author: params[:author], genre: [:genre], description: params[:description])
                        redirect to "/books/#{@book.id}"
                    else
                        redirect to "/books/#{@book.id}/edit"
                    end
                else
                    redirect to '/books'
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/books/:id/delete_confirm' do
        @book = Book.find_by_id(params[:id])
        erb :"books/delete"
    end

    delete '/books/:id/delete' do
        if logged_in?
            book = Book.find_by_id(params[:id])
            if book && book.user == current_user
                book.delete
            end
            redirect to '/books'
        else
            redirect to '/login'
        end
    end
end