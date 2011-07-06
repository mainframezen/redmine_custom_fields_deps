class CreateCustomfielddeps < ActiveRecord::Migration
  def self.up
    create_table :customfielddeps do |t|
      t.column :name, :string
      t.column :custom_master_id, :integer
      t.column :custom_slave_id, :integer
      t.column :type , :integer
      t.column :yaml, :text
    end
   
    add_index :customfielddeps, [:custom_master_id, :custom_slave_id], :unique=>true

  end

  def self.down
    drop_table :customfielddeps
  end
end
