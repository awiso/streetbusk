# Preview all emails at http://localhost:3000/rails/mailers/contribution_mailer
class ContributionMailerPreview < ActionMailer::Preview
  def contribute
    user = User.first
    ContributionMailer.contribute(user)
  end
end
