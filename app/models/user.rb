class User < ActiveRecord::Base
  # acts_as_token_authenticatable
  include Honor
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recommendations
  has_many :bookmarks
  acts_as_commontator
  BAIRROS = ["Ajuda", "Alcântara", "Alvalade", "Areeiro", "Arroios",
                  "Avenidas Novas", "Beato", "Belém", "Benfica",
                  "Campolide", "Campo de Ourique", "Carnide", "Estrela",
                  "Lumiar", "Marquês de Pombal", "Marvila", "Misericórdia",
                  "Parque das Nações", "Penha França", "Santa Clara",
                  "Santa Maria Maior", "São Domingos", "São Vicente"]
end
