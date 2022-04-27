class AddTitleToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :user_id, :integer
    add_column :rooms, :reservation_id, :integer
  end
end
