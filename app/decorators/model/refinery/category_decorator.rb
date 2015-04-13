#not sure if the path on this is right
#seems to be working
Refinery::Products::Category.class_eval do

  #self.table_name = 'refinery_products_categories'
  #self.primary_key = 'id_from_vendor'

  has_many :spec_categories, :class_name => '::Refinery::ProductSpecs::SpecCategory', :foreign_key => 'category_id'
  has_many :images, :as => :imagable, :class_name => '::Refinery::Products::ProductImage', :dependent => :destroy

  def custom_slug_or_title
    self.title
  end

end

