class AddUsernameAndRolesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string, :null => false, :default => ""
    add_column :users, :roles, :integer, :default => 0
    
    add_index :users, :username, :unique => true
  end

  def self.down
    remove_column :users, :roles
    remove_column :users, :username
  end
end
