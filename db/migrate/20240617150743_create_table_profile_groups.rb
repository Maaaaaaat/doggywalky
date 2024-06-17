class CreateTableProfileGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :table_profile_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.timestamps
    end
  end
end
