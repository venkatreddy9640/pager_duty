class CreateDeveloperTables < ActiveRecord::Migration
  def change
    create_table :developer_tables do |t|
      t.string :name, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :mobile, null: false, unique: true

      t.integer :team_id, null: false
      t.timestamps
    end
  end
end
