class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject_class
      t.string :name

      t.timestamps
    end
    add_index :permissions, :subject_class
  end
end
