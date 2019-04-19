class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true

  def gravatar_url
    avatar_id = Digest::MD5::hexdigest(email).downcase
    url = "https://api.adorable.io/avatars/80/#{avatar_id}"
  end
end
