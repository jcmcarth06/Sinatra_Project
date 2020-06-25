class BooksController < ApplicationController

    get '/books/:slug' do
        @book = Book.find_by_slug(params[:slug])
        erb :'books/show'
    end

    get '/books' do
        verify_logged_in
            @books = Book.all
            erb :'books/index'
    end

    get 'books/new' do
        verify_logged_in
            erb :'books/new'
    end

    post '/books' do
        verify_logged_in
            if params[:content] == ""
              redirect to "/books/new"
            else
                @book = current_user.books.build(title: params[:title], author: params[:author], genre: params[:genre] )
                if @book.save
                    redirect to "/books/#{@book.id}"
                else
                    redirect to "/books/new"
                end
            end
    end

    get '/books/:id' do
        verify_logged_in
            @book = Book.find_by_id(params[:id]) #shows the book by its individual id
            erb :'books/show_book'
    end

    get '/books/:id/edit' do
        verify_logged_in
            @book = book.find_by_id(params[:id])
            if @book && @book.user == current_user #only the user can edit their own book
                erb :'books/edit_book'
            else
                redirect to '/books'
            end
    end

    patch '/books/:id' do
        verify_logged_in
            if params[:content] == ""
              redirect to "/books/#{params[:id]}/edit"
            else
              @book = book.find_by_id(params[:id])
                if @book && @book.user == current_user
                    if @book.update(content: params[:content])
                        redirect to "/books/#{@book.id}"
                    else
                        redirect to "/books/#{@book.id}/edit"
                    end
                else
                    redirect to '/books'
                end
            end
    end

    delete '/books:id' do
        verify_logged_in
            @book = book.find_by_id(params[:id])
            if @book && @book.user == current_user
                @book.delete
            end
            redirect to '/books'
    end

end