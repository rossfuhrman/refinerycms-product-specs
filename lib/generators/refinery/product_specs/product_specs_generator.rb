module Refinery
  class ProductSpecsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def generate_product_specs_initializer
      template 'config/initializers/refinery/product_specs.rb.erb', File.join(destination_root, 'config', 'initializers', 'refinery', 'product_specs.rb')
    end

    def rake_db
      rake "refinery_product_specs:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Product Specs extension
Refinery::ProductSpecs::Engine.load_seed
        EOH
      end
    end
  end
end
