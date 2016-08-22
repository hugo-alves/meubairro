class Recommendation < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_commontable
  acts_as_votable
  belongs_to :user
  geocoded_by :address   # can also be an IP address
  after_validation :geocode
  # after_create :send_reco
  ratyrate_rateable 'rating'
  private

  def send_reco

  end
end
