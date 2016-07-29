class Api::V1::SpeechesController < ApiController

  def index
    render json: Speech.order("id DESC")
  end

  def create
    Speech.create(title: params[:title])
    render json: {
      text: Wit::Client.new.post(
        params[:file],
        params[:title]
                                )
    }
  end

  def notify_email

  end

  def notify_slack

  end
end
