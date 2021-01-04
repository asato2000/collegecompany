class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :teacher_name
      t.string :subject
     

      t.timestamps
    end
  end
end
