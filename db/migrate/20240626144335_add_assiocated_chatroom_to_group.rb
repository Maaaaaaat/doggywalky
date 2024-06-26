class AddAssiocatedChatroomToGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :associated_chatroom, :integer
  end
end
