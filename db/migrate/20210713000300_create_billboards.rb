class CreateBillboards < ActiveRecord::Migration[6.0]
  def change
    create_table :billboards do |t|
      t.string :name
      t.string :image
      t.float :lat  
      t.float :lon
      t.text :size
      t.string :screen_type
      t.string :direction
      t.string :orientation
      t.string :unit_type


      t.timestamps
    end
  end
end
