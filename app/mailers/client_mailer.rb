# frozen_string_literal: true

class ClientMailer < ApplicationMailer
  default from: "welcome@wishlist.com"

  before_action :load_client

  def welcome
    mail(to: @data['email'], subject: @data['subject'])
  end

  private
  def load_client
    @data = params[:response]
  end
end
