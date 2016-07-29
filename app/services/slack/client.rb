module Slack
  class Client
    def send_message(channel: '#flagit', message: 'Hello from the other side')
      client = Slack::Web::Client.new
      client.auth_test

      client.chat_postMessage(channel: channel, text: message, as_user: true)
    end
  end
end
