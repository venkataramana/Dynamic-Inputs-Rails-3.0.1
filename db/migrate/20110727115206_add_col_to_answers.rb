class AddColToAnswers < ActiveRecord::Migration
  def self.up
          add_column :answers, :range_start, :decimal
          add_column :answers, :range_stop, :decimal
  end

  def self.down
          remove_column :answers, :range_start
          remove_column :answers, :range_stop
  end
end

