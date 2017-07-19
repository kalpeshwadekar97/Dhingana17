json.extract! @user, :id, :first_name, :last_name, :gender, :email, :mobile
if @user.user_event_registrations.present?
  json.user_registered_events do |json|
    json.array!(@user.user_event_registrations) do |user_events|
      json.extract! user_events, :id, :event_id, :payment_gateway, :status 
        json.event do |event|
          json.extract! user_events.event, :id, :title, :mrp, :start_date, :end_date, :location, :city, :state, :status, :description
          json.url 'http://lorempixel.com/1024/786/'
        end
    end
  end
else
  json.no_registered_event_message @user.no_event_message
end


