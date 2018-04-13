class AddIndexToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_index 'players', [:sport_id,:lastname, :firstname]
  end
end
