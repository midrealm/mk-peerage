class LaurelMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views
  def comment(current_user,candidate, comment)
    @current_user = current_user
    @candidate = candidate
    @comment = comment
    subject = "Candidate ##{candidate.id} Comment"
    mail(to: 'laurel@laurelist.org', subject: subject, from: 'no_reply@laurelist.org')
  end
  def reset_password_instructions(record, token, opts={})
    @token = token
    if record.last_sign_in_at.nil? && record.created_at > (Time.now - 10.minutes)
      if record.royalty?
        devise_mail(record, :royal_welcome, opts)
      else
        devise_mail(record, :welcome, opts)
      end
    else
      devise_mail(record, :reset_password_instructions, opts)
    end
  end
  def contact_user(user, subject, from_name, from_email, message)
    @message = message
    @from_name = from_name
    @from_email = from_email
    mail(to: user.email, from:'no_reply@laurelist.org', subject: "Contact from Midrealm Peerage Site: #{subject}", reply_to: from_email)
  end
end
