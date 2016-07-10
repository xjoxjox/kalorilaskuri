class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :meals

  def self.find_for_oauth(auth)
    if !where(email: auth.info.email).empty?
      user = find_by(email: auth.info.email)
      user.update_attribute(:provider, auth.provider)
      user.update_attribute(:uid, auth.uid)
      user
    else
      if where(provider: auth.provider, uid: auth.uid).first.nil?
        user = User.new provider:auth.provider,
                        uid:auth.uid,
                        email: auth.info.email.present? ? auth.info.email : 'vaihda@minut.com',
                        password:Devise.friendly_token[0,20]
        user.save!
        user
      else
        where(provider: auth.provider, uid: auth.uid).first
      end
    end
  end
end
