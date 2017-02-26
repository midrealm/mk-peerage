class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable 

  def slug
    return self.sca_name.tr(' ', '_')
  end  

  def url
    return "/laurels/#{self.slug}"
  end
end
