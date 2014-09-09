class AddFirstnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street, :string
    add_column :users, :town, :string
    add_column :users, :county, :string
    add_column :users, :post_code, :string
    add_column :users, :dob, :date
  end
end
