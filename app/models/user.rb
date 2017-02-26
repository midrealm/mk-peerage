class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable 

  has_many :specializations
  has_many :specialties, through: :specializations
  def slug
    return self.sca_name.tr(' ', '_')
  end  

  def url
    return "/laurels/#{self.slug}"
  end

  def show_specialties
    return self.specialties.map{|s| s.name}.to_sentence
  end
end
