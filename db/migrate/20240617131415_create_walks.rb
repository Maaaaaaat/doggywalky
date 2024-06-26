class CreateWalks < ActiveRecord::Migration[7.1]
  def change
    create_table :walks do |t|
      t.date :date
      t.time :start_time
      t.string :adress
      t.references :group, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
