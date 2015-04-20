Refinery::Products::Category.class_eval do

  has_many :spec_categories, :class_name => '::Refinery::ProductSpecs::SpecCategory', :foreign_key => 'category_id'
  has_many :images, :as => :imagable, :class_name => '::Refinery::Products::ProductImage', :dependent => :destroy

  def custom_slug_or_title
    self.title
  end

  def specs
    (parent.blank? ? ActiveSupport::OrderedHash.new : parent.specs).tap do |hash|
      spec_categories.each { |g| hash[g] = g.specs }
    end
  end

  def flattened_specs
    spec_categories.map(&:specs).flatten.sort_by(&:priority_sequence)
  end

  def default_spec_columns
    default_specs.map &:name
  end

  def default_specs
    specs.values.flatten[0..2]
  end

  def sort_options(count)
    begin
      products.first.specs.values.first.keys.first(count).map{|s| [s.name.upcase, s.id_from_vendor]}
    rescue
      []
    end
  end

end

