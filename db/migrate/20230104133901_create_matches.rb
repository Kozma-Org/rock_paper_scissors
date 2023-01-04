class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.belongs_to :user
      t.string :player_hand,  null: false, default: ""
      t.string :oponent_hand, null: false, default: ""
      t.integer :status,      null: false, default: 0

      t.timestamps
    end
  end
end
