class List < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates_presence_of :name, message: 'YOYO'
  before_validation :set_name


  private
    def set_name
      self.name = 'Default Name' unless self.name
    end

end
