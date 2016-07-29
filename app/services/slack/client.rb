module Slack
  class Client
    def send_message(channel: '#flagit', message: 'Hello from the other side')
      client = Slack::Web::Client.new
      client.auth_test

      client.chat_postMessage(channel: channel, text: message, as_user: true)
    end

    # def send_wav_file(path:)
    #   client = Slack::Web::Client.new
    #   client.auth_test


    #   # client.files_upload(channel: '#general',
    #   client.files_upload(channel: 'C025VFWPX',
    #                       file: Faraday::UploadIO.new('./sloth.jpg', 'image/jpeg'),
    #                       as_user: true,
    #                       title: 'Sloth',
    #                       filename: 'sloth.jpg',
    #                       initial_comment: 'Attached a selfie.'
    #                      )
    # end
  end
end
