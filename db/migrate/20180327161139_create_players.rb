class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :firstname
      t.string :lastname
      t.string :position
      t.integer :age
      t.integer :sport_id
      t.timestamps
    end
    add_index 'players', [:lastname, :firstname]
  end
end
