class AddSellerToPosts < ActiveRecord::Migration[5.2]
  def change
     add_reference :posts, :seller, foreign_key: {to_table: :users} 
  end
end
