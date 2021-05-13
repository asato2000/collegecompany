class AddBuyerToPosts < ActiveRecord::Migration[5.2]
  def change
      add_reference :posts, :buyer, foreign_key: {to_table: :users} 
  end
end
