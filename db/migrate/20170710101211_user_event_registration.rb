class UserEventRegistration < ActiveRecord::Migration[5.0]
  def change
    create_table :user_event_registrations, id: false do |t|
      t.column :id, INT_PRIMARY_ID
      t.column :user_id, BIGINT_UNSIGNED, index: true
      t.column :event_id, UNSIGNED_NULL, index: true
      t.column :status, UNSIGNED_NULL, index: true
      t.integer :payment_gateway
      t.timestamps null: false
    end

  end
end
