class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id, null: false
      t.integer :room_id, null: false

      t.timestamps
    end
  end
end
