class AddEventIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_id, :string, null: false
  end
end
