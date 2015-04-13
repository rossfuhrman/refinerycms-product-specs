module Refinery
  module ProductSpecs
    class SpecCategory < Refinery::Core::BaseModel
      self.table_name = 'refinery_products_spec_categories'

      belongs_to :category, :class_name => 'Refinery::Products::Category', :primary_key => 'id'
      #has_many :specs, :order => :position, :dependent => :destroy, :class_name => 'ProductSpec'
      has_many :specs, :dependent => :destroy, :class_name => 'ProductSpec'

      accepts_nested_attributes_for :specs

      scope :search, lambda { |query| where(['name LIKE ?', "%#{query}%"]) }

    end
  end
end
