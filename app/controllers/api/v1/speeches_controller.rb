class Api::V1::SpeechesController < ApiController

  def index
    render json: Speech.order("id DESC")
  end

  def create
    Speech.create(title: params[:title])
    render json: {title: params[:file], text: Wit::Client.new.post(params[:file])}
  end
end
