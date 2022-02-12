require "rails_helper"

RSpec.describe ClientMailer, type: :mailer do 
  let(:mail) { described_class.with(response: response).welcome.deliver_now! }

  describe '#welcome' do
    let(:response) do
      {
        subject: "Welcome, John Doe",
        email: "john.doe@teste.com",
        name: "John Doe",
        type: 'send_email_welcome_to_client' 
      }.with_indifferent_access
    end
    
    it { expect(mail.subject).to eq("Welcome, John Doe") }
    it { expect(mail.from).to eq(['welcome@wishlist.com']) }
    it { expect(mail.to).to eq(["john.doe@teste.com"]) }
    it { expect(mail.body.encoded).to match('John Doe') }
  end
end
