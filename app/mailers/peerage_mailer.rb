class PeerageMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def comment(current_user,candidate, comment)
    @current_user = current_user
    @candidate = candidate
    @comment = comment
    peerage = @candidate.peerage_type.to_sym
    subject = "Candidate ##{candidate.id} Comment"
    mail(to: self.class.mailing_list[peerage], subject: subject, from: self.class.no_reply)
  end
  def add_to_peerage(user, peerage)
    @user = user 
    @names = Hash.new
    case peerage
    when :laurel
      @names = {collection: 'laurelate', name: 'Laurel' } 
    end
    subject = "Welcome to the Middle Kingdom #{@names[:collection].capitalize}"
    mail(to: @user.email, subject: subject, from: self.class.no_reply)
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
    mail(to: user.email, from: self.class.no_reply, subject: "Contact from Midrealm Peerage Site: #{subject}", reply_to: from_email)
  end

  private
  def self.no_reply
    'no_reply@peerage.org'
  end
  def self.mailing_list
    { laurel: 'laurel@laurelist.org', pelican: 'pelican@pelicanlist.org'}
  end

end
