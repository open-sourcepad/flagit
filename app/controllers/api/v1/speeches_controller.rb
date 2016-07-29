class Api::V1::SpeechesController < ApiController

  def create
    puts "*********************"
    puts params[:file]
    puts params[:title]
    Speech.create(title: params[:title], audio: params[:file])
    puts "*********************"
    render json: {text: Wit::Client.new.post(params[:file])}
  end

end
