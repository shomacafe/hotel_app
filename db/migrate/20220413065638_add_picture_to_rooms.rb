class AddPictureToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :picture, :string
  end
end
