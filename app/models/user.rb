class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :as_runs

  def self.create_from_provider_data(provider_data , provider)
    where(provider: provider, uid: provider_data['id']).first_or_create do | user |
      user.password = Devise.friendly_token[0, 20]
      email = "#{provider_data['screen_name']}@#{provider}.com"
      user.email = email
    end
  end

end
