class Api::V1::SpeechesController < ApiController

  def create
    puts params
    render json: {text: Wit::Client.new.post(params[:file])}
  end

end
