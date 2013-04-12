class CpfCnpjToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :cpf
      t.string :cnpj
    end
  end
end
