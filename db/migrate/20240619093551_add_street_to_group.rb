class AddStreetToGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :street, :string
  end
end
