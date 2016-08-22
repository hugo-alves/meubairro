class Reco < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_commontable
  acts_as_votable
  default_scope { order(:cached_votes_up => :desc, :cached_votes_down => :asc) }
  belongs_to :user
  # after_create :send_reco

  private

  def send_reco

  end
end
