module Slack
  class Client
    attr_accessor :channel, :speech

    def initialize(channel:, speech:)
      @channel = channel
      @speech = speech
    end

    def send_message
      client = Slack::Web::Client.new
      client.auth_test

      client.chat_postMessage(
        channel: channel,
        as_user: true,
        mrkdwn: true,
        text: parsed_text
      )

      return parsed_text
    end

    def parsed_text
      key_points_formatted = speech.key_points.collect do |key_point| <<-EOF
- #{key_point}

      EOF
       end

      aw = <<-EOF
*Here are the highlights from your #{speech.title} meeting:*

#{key_points_formatted.join}

And the summary:

_#{speech.summarized_text}"_

:smile:
      EOF
    end
  end
end
