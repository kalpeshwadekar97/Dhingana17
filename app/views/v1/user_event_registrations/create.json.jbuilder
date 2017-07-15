json.extract! @user_event_registration, :id, :user_id, :event_id, :status, :payment_gateway, :created_at
json.message @user_event_registration.message