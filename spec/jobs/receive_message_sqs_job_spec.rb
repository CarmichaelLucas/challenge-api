# fronzen_string_literal: true

require 'rails_helper'

RSpec.describe ReceiveMessageSqsJob, type: :job do
  include ActiveJob::TestHelper

  let(:response) do 
    {
      subject: "Welcome, John Doe",
      email: "john.doe@teste.com",
      name: "John Doe",
      type: 'send_email_welcome_to_client' 
    }.with_indifferent_access
  end

  let(:instance_job) { described_class.perform_later(response) }

  describe '#perform' do
    it { expect { instance_job }.to have_enqueued_job }
  end
end
