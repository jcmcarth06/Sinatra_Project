class BooksController < ApplicationController

    get '/books' do
        verify_logged_in
        @books = Book.all
        erb :'books/index'
    end

    get '/books/new' do
        verify_logged_in
        @genres = Genre.all
        erb :'books/new'
    end

    post '/books' do
        verify_logged_in
        if params[:title] == ""
            redirect to "/books/new"
        else
            @book = current_user.books.build(title: params[:title], author: params[:author], genre_id: params[:genre_id], description: params[:description])
            if @book.save
                redirect to "/books/#{@book.id}"
            else
                redirect to "/books/new"
            end
        end
    end

    get '/books/:id' do
        verify_logged_in
        @book = Book.find_by_id(params[:id])
        erb :'books/show'
    end

    get '/books/:id/edit' do
        verify_logged_in
        @book = Book.find_by_id(params[:id])
        if @book && @book.user == @current_user  #only the user can edit their own book
            @genres = Genre.all
            erb :'books/edit'
        else
            redirect to "/books"
        end
    end

    patch '/books/:id' do
        verify_logged_in
        if params[:title] == "" || params[:author] == "" || params[:genre] == ""
            redirect to "/books/#{params[:id]}/edit"
        else
            @book = Book.find_by_id(params[:id])
            if @book && @book.user == current_user
            if @book.update(title: params[:title], author: params[:author], genre_id: params[:genre_id], description: params[:description])
                redirect to "/books/#{@book.id}"
            else
                redirect to "/books/#{@book.id}/edit"
            end
            else
            redirect to "/books"
            end
        end
     end
    

    get '/books/:id/delete_confirm' do
        verify_logged_in
        @book = Book.find_by_id(params[:id])
        if @book.user == current_user
            erb :"/books/delete"
        else
            redirect to "/books"
        end
    end

    delete '/books/:id/delete' do
        verify_logged_in
        book = Book.find_by_id(params[:id])
        if book && book.user == current_user
            book.delete
        end
        redirect to '/books'
    end
end