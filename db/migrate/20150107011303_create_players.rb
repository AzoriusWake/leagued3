class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to  :match
      t.string      :highestAchievedSeasonTier
      t.string      :role
      t.string      :lane
      t.integer     :xpPerMinDeltas
      t.integer     :goldPerMinDeltas
      t.string      :winner
      t.integer     :champLevel
      t.integer     :kills
      t.integer     :deaths
      t.integer     :assists
      t.integer     :minionsKilled
      t.timestamps
    end
  end
end
