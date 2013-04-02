class AddCustomerToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :customer
    end
  end
end
