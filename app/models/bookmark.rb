class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :recommendations
  validates_uniqueness_of :user_id, :scope => [:recommendation_id]
end
