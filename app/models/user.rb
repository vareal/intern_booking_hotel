class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :orders, dependent: :destroy

  scope :get_publishers, -> { where role: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :avatar, length: {maximum: 250}

  enum role: {user: 0, publisher:1, admin: 2}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  # def self.new_with_session params, session
  #   super.tap do |user|
  #     if data = session["devise.#{provider}_data"] &&
  #       session["devise.#{provider}_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end
end
