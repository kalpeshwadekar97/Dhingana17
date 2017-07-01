class V1::StaticsController < ApiController
  before_action :set_fields, only: [:index]

  # GET /v1/statics
  # GET /v1/statics.json
  def index

  end

  def set_fields
    all_fields = params["fields"].present? ? params["fields"].split(',').collect(&:strip) : []
    @fields = all_fields
  end
end
