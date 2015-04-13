module Refinery
  module ProductSpecs
    class ProductSpec < ActiveRecord::Base
      require 'acts_as_list'

      self.table_name = 'refinery_products_specs'

      belongs_to :spec_category, :class_name => 'Refinery::Products::SpecCategory'
      belongs_to :product, :class_name => 'Refinery::Products::Product'

      validates_presence_of :name

      acts_as_list :scope => :spec_category

      def title
        name
      end

    end
  end
end
