class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.string :type
      t.string :phone
      t.string :email, null: false

      t.timestamps
    end
    add_index :suppliers, :email, unique: true
  end
end
