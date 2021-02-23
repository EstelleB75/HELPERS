class CreateAssos < ActiveRecord::Migration[6.0]
  def change
    create_table :assos do |t|
      t.string :name
      t.string :address
      t.string :city
      t.text :description
      t.string :email
      t.string :website
      t.string :phone_number

      t.timestamps
    end

    remove_column :favs, :association_id
    add_reference :favs, :asso

    remove_column :association_tags, :association_id
    add_reference :association_tags, :asso

    drop_table :associations
  end
end
