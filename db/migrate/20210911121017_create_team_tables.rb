class CreateTeamTables < ActiveRecord::Migration
  def change
    create_table :team_tables do |t|

      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
