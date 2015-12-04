class Item < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :list_id, :name, :description
  validates_uniqueness_of :name
  validates_inclusion_of :priority, in: [1,2,3,4,5,6,7,8,9,10], message: 'needs to be 1 - 5'
end
