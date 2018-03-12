class CreateHotelUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :hotel_users do |t|
      t.belongs_to :user
      t.belongs_to :hotel

      t.timestamps
    end
  end
end
