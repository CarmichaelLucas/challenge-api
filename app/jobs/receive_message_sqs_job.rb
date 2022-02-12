# fronzen_string_literal: true

Shoryuken.sqs_client_receive_message_opts = {
  max_number_of_messages: 1
}

class ReceiveMessageSqsJob < ApplicationJob
  queue_as 'wishlist-email-service.fifo'

  def perform(response)
    if response['type'].eql?('send_email_welcome_to_client')
      ClientMailer.with(response: response).welcome.deliver_now!
    end
  end
end
