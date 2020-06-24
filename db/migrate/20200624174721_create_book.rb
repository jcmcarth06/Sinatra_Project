class CreateBook < ActiveRecord::Migration
  def change
    create_table :book do |t|
      t.string :title
      t.integer :author_id #foreign key
      t.integer :genre_id
    end
  end
end
