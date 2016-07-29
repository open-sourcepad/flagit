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
      )}
  end

  def summarize
    speech = Speech.find_by_id(params[:id])

    unless speech.summarized_text
      Summarizer::Client.new.summarize(speech)
    end

    if speech.key_points.empty?
      Summarizer::KeyPoints.new.get_key_points(speech)
    end

    render json: speech
  end

  def notify_slack
    speech = Speech.find_by_id(params[:id])

    summarized_text = speech.summarized_text || 'This is the summarized text guys'

    Slack::Client.new.send_message(
      channel: "#flagit",
      message: "Your speech, *#{speech.title}*, has been summarized: #{summarized_text} :smile:",
    )

    render json: { success: true, summarized_text: summarized_text }
  end
end
