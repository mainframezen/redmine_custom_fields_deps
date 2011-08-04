class Table2 < ActiveRecord::Migration
  def self.up

    create_table :customassignee do |t|
      t.column :project_id, :integer
      t.column :custom_master_id, :integer
      t.column :custom_slave_id, :integer
      t.column :custom_master_value, :string
      t.column :custom_slave_value, :string
      t.column :assignee_id, :integer
    end

  end

  def self.down
    drop_table :customassignee
  end
end
