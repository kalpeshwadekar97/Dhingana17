class V1::Admin::EventsController < V1::AdminController
  before_action :set_event, only: [:show]
  before_action :set_fields, only: [:show, :index]

  def index
    @events = Event.includes(set_includes).all
    event_filter
    @events = @events.all.reverse
  end

  def show
    
  end

  def create
    @event = event.new(event_params)
      if @event.save
        render json: @event, status: :created 
      else
        render json: @event.errors, status: :unprocessable_entity 
      end
  end

  def update
    if @event.update(event_params)
      render :show, status: :ok  
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  def event_filter
    if params[:event].present?
      @events = @events.where(event_filter_params)
      @events = @events.where('events.title LIKE ?',"%#{params[:event][:term]}%") if params[:event][:term].present?
      @events = @events.where('start_date >= ?', Time.zone.parse(params[:events][:from]).to_date) if params[:events][:from].present? and Date.is_date?(params[:events][:from])
      @events = @events.where('end_date <= ?', Time.zone.parse(params[:events][:till]).to_date) if params[:events][:till].present? and Date.is_date?(params[:events][:till])
    end
  end

  def event_params
    params.require(:event).permit(:event_size_id, :quantity, :user_id )
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_includes
    include = []
    include
  end

  def event_filter_params
    filter_params = params.require(:event).permit(:status, :state, :city, :event_type)
    filter_params.map{ |key, value| filter_params[key] = nil if value.to_s.downcase == "null"}
    filter_params
  end


  def set_fields
    all_fields = params["fields"].present? ? params["fields"].split(',').collect(&:strip) : []
    @fields = (all_fields & Event.attribute_names) | [:id, :title, :status]
    @additional_fields = (all_fields & Event.reflect_on_all_associations.map {|object| object.name.to_s}) | []
  end

end
