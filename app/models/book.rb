class Book < ActiveRecord::Base
    belongs_to :user
    belongs to :genre
end