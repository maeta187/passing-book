class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id
      # t.string :url
      t.string :title
      t.string :image
      t.string :description
      t.timestamps
    end
  end
end
