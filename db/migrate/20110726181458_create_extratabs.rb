class CreateExtratabs < ActiveRecord::Migration
  def self.up
    create_table :extratabs do |t|
      t.integer :extra

      t.timestamps
    end
  end

  def self.down
    drop_table :extratabs
  end
end
