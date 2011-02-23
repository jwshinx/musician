class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :reference
  end

  def self.down
    remove_column :users, :role_id
  end
end
