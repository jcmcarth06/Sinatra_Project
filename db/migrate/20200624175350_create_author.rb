class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :author do |t|
      t.string :name
    end
  end
end
