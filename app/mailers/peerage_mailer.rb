class PeerageMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def comment(current_user,candidate, comment, presenter=nil)
    @current_user = current_user
    @candidate = candidate
    @comment = comment
    @presenter = presenter
    peerage = @candidate.peerage_type.to_sym
    subject = "Candidate ##{candidate.id} Comment"
    mail(to: Peer.subclass(peerage).mailing_list, subject: subject, from: self.class.no_reply)
  end
  def add_to_peerage(user, peerage)
    @user = user 
    @names = self.class.names(peerage)
    subject = "Welcome to the Middle Kingdom #{@names[:collection].capitalize}"
    mail(to: @user.email, subject: subject, from: self.class.no_reply)
 end
  def reset_password_instructions(record, token, type=nil, opts={})
    @token = token
    if type === 'setup'
      devise_mail(record, :setup, opts)
    elsif record.last_sign_in_at.nil? && record.created_at > (Time.now - 10.minutes)
      if record.royalty?
        devise_mail(record, :royal_welcome, opts)
      else
        @names = self.class.names(record.peers.first.order)
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
  def contact_order_secretary(secretary, subject, from_name, from_email, message)
    @peerage = secretary.type.to_s
    @message = message
    @from_name = from_name
    @from_email = from_email
    mail(to: secretary.email, from: self.class.no_reply, subject: "Order Secretary Contact from Midrealm Peerage Site: #{subject}", reply_to: from_email)
  end

  private
  def self.no_reply
    ENV['DEVISE_MAIL_SENDER']
  end
  def self.names(peerage)
    peerage_class = Peer.subclass(peerage)
    {collection: peerage_class.collection, name: peerage_class.peerage_name}
  end
end
