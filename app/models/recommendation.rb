class Recommendation < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_commontable
  acts_as_votable
  default_scope { order(:cached_votes_up => :desc) }
  belongs_to :user
  has_many :bookmarks
  geocoded_by :address   # can also be an IP address
  after_validation :geocode
  validates :bairro, presence: true
  # after_create :send_reco
  ratyrate_rateable 'rating'
  private

  def send_reco

  end
end
