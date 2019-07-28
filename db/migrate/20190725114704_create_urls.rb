class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :url

      t.timestamps
    end
  end
end
