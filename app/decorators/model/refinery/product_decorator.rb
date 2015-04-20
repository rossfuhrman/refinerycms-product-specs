Refinery::Products::Product.class_eval do
  
  has_many :spec_values, :class_name => '::Refinery::ProductSpecs::SpecValue', :foreign_key => 'product_id', :dependent => :destroy
  has_many :images, :as => :imagable, :class_name => '::Refinery::Products::ProductImage', :dependent => :destroy

  accepts_nested_attributes_for :spec_values, allow_destroy: true

  attr_accessor :flattened_specs

  def display_name
    self.long_name || self.name || self.non_display_name || nil
  end

  def specs
    parent_category.specs.tap do |group_hash|
      group_hash.each_pair do |key, value_array|
        value_hash = ActiveSupport::OrderedHash.new
        value_array.each do |spec|
          value_hash[spec] = spec_value_for(spec)
        end
        group_hash[key] = value_hash
      end
    end
  end

  def flattened_specs(count = 10)
    specs = parent_category.flattened_specs
    specs = specs.first(count) if count
    value_hash = ActiveSupport::OrderedHash.new

    specs.each do |spec|
      value = spec_value_for(spec)
      value_hash[spec] = value #unless value.blank?
    end

    value_hash
  end

  def spec_value_for(spec)
    spec_values.select {|v|
      (v.id_from_vendor && v.id_from_vendor == spec.id_from_vendor)
    }.first
  end

  def formatted_spec_value_for(spec, short = false)
    spec_value_for(spec).try(:formatted_value, spec, short)
  end

end
