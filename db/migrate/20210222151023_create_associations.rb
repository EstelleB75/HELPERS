class CreateAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :associations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.text :description
      t.string :email
      t.string :website
      t.string :phone_number

      t.timestamps
    end
  end
end
