class Reco < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  acts_as_commontable
  acts_as_votable
  belongs_to :user
end
