class CreatePokemonDataEntries < ActiveRecord::Migration
  def change
    create_table :pokemon_data_entries do |t|
      t.string :name
      t.string :chinese_name
      t.string :aliases
      t.integer :hp
      t.integer :at
      t.integer :df
      t.integer :sa
      t.integer :sd
      t.integer :sp
      t.integer :sum
    end
  end
end
