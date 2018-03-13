class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :country_code
      t.text :description
      t.float :average_price
      t.integer :views_count

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Hotel.create_translation_table! description: :text, average_price: :float
      end

      dir.down do
        Hotel.drop_translation_table!
      end
    end
  end
end
