class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events, :id=>false do |t|
      t.column :id, BIGINT_PRIMARY_ID
      t.string :title, index: true, null: false
      t.float :mrp
      t.string :event_type
      t.string :location
      t.string :city, limit:50
      t.string :state, limit:50
      t.integer :status, limit:1 , default:0, index: true, comment: "0=>Comming Soon,1=>OnGoing,2=>Completed,3=>Cancelled"
      t.text :description
      t.date :start_date, index: true, null: false
      t.date :end_date, index: true, null: false
      t.timestamps null: false
    end
  end
end
