class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :description
      t.date :birth_on
      t.string :role

      t.timestamps
    end
  end
end
