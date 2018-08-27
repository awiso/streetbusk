class ContributionMailer < ApplicationMailer
  def contribute(recipient, donor, amount, message)
    @recipient = recipient
    @donor = donor
    @amount = amount
    @message = message

    mail(to: @recipient.email, subject: 'Welcome to Le Wagon')
  end
end
