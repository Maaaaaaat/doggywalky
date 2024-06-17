class RenameOldTableNameToNewTableName2 < ActiveRecord::Migration[7.1]
  def change
    rename_table :table_profile_groups, :profile_groups

  end
end
