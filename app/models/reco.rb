class Reco < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_commontable
  acts_as_votable
  belongs_to :user
  after_create :send_reco

  private

  def send_reco

  end
end
