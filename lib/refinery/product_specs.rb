require 'refinerycms-core'
require 'refinerycms-wymeditor'
require 'friendly_id'
require 'refinerycms-acts-as-indexed'

module Refinery
  autoload :ProductSpecsGenerator, 'generators/refinery/product_specs/product_specs_generator'

  module ProductSpecs
    require 'refinery/product_specs/engine'
    require 'refinery/product_specs/configuration'

    autoload :Tab, 'refinery/product_specs/tabs'

    class << self
      attr_writer :root
      attr_writer :tabs

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def tabs
        @tabs ||= []
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end

      def attach!
        # dosnt work wothout this...
        require root.join('app/decorators/model/refinery/product_decorator.rb')
        require root.join('app/decorators/model/refinery/category_decorator.rb')
      end

    end
  end
end
