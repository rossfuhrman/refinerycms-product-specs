#not sure if the path on this is right
#seems to be working
Refinery::Products::Product.class_eval do
  #this is wrong :(
  #has_many :specs, :class_name => '::Refinery::ProductSpecs::ProductSpec', :foreign_key => 'refinery_product_id'
  
  has_many :spec_values, :class_name => '::Refinery::ProductSpecs::SpecValue', :foreign_key => 'product_id', :dependent => :destroy
  has_many :images, :as => :imagable, :class_name => '::Refinery::Products::ProductImage', :dependent => :destroy

  def display_name
    self.long_name || self.name || self.non_display_name || nil
  end

  alias :title :display_name
end
