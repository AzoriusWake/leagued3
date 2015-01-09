class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :matchId
      t.string  :region
      t.string  :matchMode
      t.integer :matchDuration
      t.string  :season
      t.timestamps
    end
  end
end
