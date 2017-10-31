class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :body
      t.string :user
      t.date :release

      t.timestamps
    end
  end
end
