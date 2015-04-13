module Refinery
  module ProductSpecs
    module Admin
      class ProductSpecsController < ::Refinery::AdminController

        crudify :'refinery/product_specs/product_spec',
                :order => 'updated_at DESC'#,
#                :include => [:translations]

        def new
          @product_spec = Refinery::ProductSpecs::ProductSpec.new
          @product_spec.refinery_product_id = params[:product_id]
        end

        private
        def product_spec_params
          params.require(:product_spec).permit(
            :refinery_product_id,
            :name,
            :priority_sequence,
            :kind,
            :english_unit,
:english_value,
            :metric_unit
          )
        end

        def create_or_update_successful
          redirect_to redirect_url
        end

        def redirect_url
          refinery.edit_products_admin_product_path @product_spec.refinery_product_id
        end

        protected
      end
    end
  end
end
