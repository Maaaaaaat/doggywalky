class CreateAJoinTableProfileWalks < ActiveRecord::Migration[7.1]
  def change
    create_table :profile_walks do |t|
      t.references :walk, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
    end
  end
end
