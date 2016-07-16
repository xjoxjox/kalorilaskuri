class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :meals
  has_many :user_weight_developments
  has_many :user_fat_percentage_developments

  validates :username, uniqueness: :true, presence: :true, :length => { :in => 2..20 }
  validates :height, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 300 }
  validates :weight, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500 }
  validates :fat_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  def bmi
    (:height / 100)^2 / :weight
  end

  def is_social?
    !provider.nil?
  end

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
                        username: auth.info.first_name.present? ? auth.info.first_name : 'kayttaja' + auth.uid,
                        password:Devise.friendly_token[0,20]
        user.save!
        user
      else
        where(provider: auth.provider, uid: auth.uid).first
      end
    end
  end
end
