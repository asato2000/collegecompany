class AddCollegeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :college, :string
  end
end
