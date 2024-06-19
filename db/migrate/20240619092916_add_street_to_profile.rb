class AddStreetToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :street, :string
  end
end
