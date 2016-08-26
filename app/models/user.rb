class User < ActiveRecord::Base
  # acts_as_token_authenticatable
  include Honor
  acts_as_voter
  ratyrate_rater

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  mount_uploader :facebook_picture_url, PhotoUploader
  has_many :recommendations, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy
  acts_as_commontator
  BAIRROS = ["Ajuda", "Alcântara", "Alvalade", "Areeiro", "Arroios",
                  "Avenidas Novas", "Beato", "Belém", "Benfica",
                  "Campolide", "Campo de Ourique", "Carnide", "Estrela",
                  "Lumiar", "Marvila", "Misericórdia",
                  "Parque das Nações", "Penha França", "Santa Clara",
                  "Santa Maria Maior", "São Domingos", "São Vicente", "Santo Antônio"]

  def self.find_for_facebook(auth)
    user = User.find_by_email(auth.info.email)
    user = User.new if user.nil?
      # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20] if user.encrypted_password.empty?
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.facebook_picture_url = auth.info.image
    user.token = auth.credentials.token
    user.token_expiry = Time.at(auth.credentials.expires_at)

    user.save

    return user
  end
end
