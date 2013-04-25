class CnpjToCustomer < ActiveRecord::Migration
  def change
    change_table :customers do |t|
      t.string :cnpj
    end
  end
end
