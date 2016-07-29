class Api::V1::SpeechesController < ApiController

  def create
    render json: {text: Wit::Client.new.post(params[:file])}
  end

end
