class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genre do |t|
      t.string :name
    end
  end
end

