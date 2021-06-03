class AddUserRefToSuppliers < ActiveRecord::Migration[6.1]
  def change
    add_reference :suppliers, :user, null: false, foreign_key: true
    remove_index :suppliers, :email
  end
end
