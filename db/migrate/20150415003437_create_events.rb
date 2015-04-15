class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :home_team, index: true
      t.references :away_team, index: true
      t.datetime :time
      t.string :state
      t.integer :home_score
      t.integer :away_score

      t.timestamps null: false
    end
  end
end
