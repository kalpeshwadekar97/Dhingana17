class V1::StaticsController < ApiController
  before_action :set_fields, only: [:index]

  def index
  end

  def roads
    result = Static.roads
    render json: result, status: :ok
  end

  def spiritual
    result = Static.spiritual
    render json: result, status: :ok
  end


  def wildlife
    result = Static.wildlife
    render json: result, status: :ok
  end

  def beaches
    result = Static.beaches
    render json: result, status: :ok
  end

  def history
    result = Static.history
    render json: result, status: :ok
  end

  def terms_and_conditions
    result = Static.terms_and_conditions
    render json: result, status: :ok
  end

  def contact_us
    result = Static.contact_us
    render json: result, status: :ok
  end

  def payment_information
    result = Static.payment_numbers
    render json: result, status: :ok
  end

  def community
    result = Static.community
    render json: result, status: :ok
  end

  def set_fields
    all_fields = params["fields"].present? ? params["fields"].split(',').collect(&:strip) : []
    @fields = all_fields
  end
end