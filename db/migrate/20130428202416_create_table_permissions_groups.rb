class CreateTablePermissionsGroups < ActiveRecord::Migration
  def up
    create_table :groups_permissions, :id => false do |t|
      t.references :permission, :group
    end
  end
 
  def down
    drop_table :groups_permissions
  end
end
