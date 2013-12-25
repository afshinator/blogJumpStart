class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :articles, through: :taggings
  
  # on joins, ruby calls the default #to_s method on every one of tag instances;  the default #to_s for an obj produces undersirable output
  def to_s
    name
  end
end
