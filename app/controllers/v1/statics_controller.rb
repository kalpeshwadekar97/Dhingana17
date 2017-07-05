class V1::StaticsController < ApiController
  before_action :set_fields, only: [:index]

  def index
  end

  def roads
    result = Static.roads
    render json: result, status: :ok
  end

  def places
    result = Static.places
    render json: result, status: :ok
  end

  def set_fields
    all_fields = params["fields"].present? ? params["fields"].split(',').collect(&:strip) : []
    @fields = all_fields
  end
end