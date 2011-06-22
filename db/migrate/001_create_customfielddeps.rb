class CreateCustomfielddeps < ActiveRecord::Migration
  def self.up
    create_table :customfielddeps do |t|
      t.column :custom_field_id, :integer
      t.column :parent_id, :integer
    end
  end

  def self.down
    drop_table :customfielddeps
  end
end
