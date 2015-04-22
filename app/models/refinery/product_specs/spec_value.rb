module Refinery
  module ProductSpecs
    class SpecValue < ActiveRecord::Base
      self.table_name = 'refinery_products_spec_values'
      belongs_to :product, :class_name => 'Refinery::Products::Product'
      def formatted_value(spec, short = false)
        return text_value if text_value.present?

        if short
          format_english_value(spec)
        else
          "#{format_english_value(spec)} (#{format_metric_value(spec)})"
        end
      end

      def format_english_value(spec)
        "#{format(english_value)} #{spec.english_unit}"
      end

      def format_metric_value(spec)
        "#{format(metric_value)} #{spec.metric_unit}"
      end

      def spec
        @spec ||= find_spec
      end

      def has_no_value?
        english_value.blank? && metric_value.blank? && text_value.blank?
      end

      def find_spec
        if self.spec_id
          Refinery::ProductSpecs::Spec.find_by_id_from_vendor(self.spec_id)
        else
          Refinery::ProductSpecs::Spec.find_by_id_from_vendor(self.id_from_vendor)
        end
      end

      private

      def format(value)
        if value.to_i == value
          value.to_i.to_s
        else
          value.to_s
        end
      end
    end
  end
end
