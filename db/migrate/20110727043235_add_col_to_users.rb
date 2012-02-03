class AddColToUsers < ActiveRecord::Migration
  def self.up
          add_column :users, :question_id, :integer
          add_column :users, :extra_id, :integer
  end

  def self.down
          remove_column :users, :question_id
          remove_column :users, :extra_id
  end
end

