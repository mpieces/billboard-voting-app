class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :billboard_id

      t.timestamps
    end
  end
end