class CreateCustomfielddeps < ActiveRecord::Migration
  def self.up
    create_table :customfielddeps do |t|
      t.column :name, :string
      t.column :custom_master_id, :integer
      t.column :custom_slave_id, :integer
      t.column :type , :integer
    end
  end

  def self.down
    drop_table :customfielddeps
  end
end
