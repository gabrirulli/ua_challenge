class CreateHotelManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_managers do |t|
      t.belongs_to :hotel
      t.belongs_to :user

      t.timestamps
    end
  end
end
