class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :description
      t.float :lat
      t.float :lng
      t.string :color

      t.timestamps

    end
  end
end
