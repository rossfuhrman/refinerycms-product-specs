module Refinery
  module ProductSpecs
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::ProductSpecs

      initializer "register refinerycms_product_specs plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_product_specs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.products_admin_products_path }
          plugin.menu_match = /refinery\/product_specs\/?(product_specs)?/
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::ProductSpecs)
      end
    end
  end
end
