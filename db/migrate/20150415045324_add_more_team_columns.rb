class AddMoreTeamColumns < ActiveRecord::Migration
  def change
    add_column :teams, :first_name, :string
    add_column :teams, :last_name, :string
    add_column :teams, :full_name, :string
  end
end
