class CreateAssociationTags < ActiveRecord::Migration[6.0]
  def change
    create_table :association_tags do |t|
      t.references :association, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
