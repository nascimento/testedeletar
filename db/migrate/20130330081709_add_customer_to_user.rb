class AddCustomerToUser < ActiveRecord::Migration
  def change
    alter_table(:users) do |t|
      t.references :customer
    end
  end
end
