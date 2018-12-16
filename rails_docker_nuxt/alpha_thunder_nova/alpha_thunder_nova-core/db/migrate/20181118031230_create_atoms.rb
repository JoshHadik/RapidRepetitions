class CreateAtoms < ActiveRecord::Migration[5.2]
  def change
    create_table :atoms do |t|
      t.string :name
      t.string :symbol
      t.integer :num_of_electrons

      t.timestamps
    end
  end
end
