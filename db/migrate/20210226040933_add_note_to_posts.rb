class AddNoteToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :note, :string
  end
end
