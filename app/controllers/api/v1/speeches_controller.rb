class Api::V1::SpeechesController < ApiController

  def create
    puts "*********************"
    puts params[:file]
    puts params[:title]
    puts "*********************"
    render json: {text: Wit::Client.new.post(params[:file])}
  end

end
