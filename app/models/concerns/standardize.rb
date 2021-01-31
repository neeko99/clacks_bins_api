module Standardize
  extend ActiveSupport::Concern

  class_methods do
    def consistentize(*fields)
      fields.each do |field|
        define_method "#{field}=" do |value|
          return if value.blank?

          super(value.consistentize)
        end
      end
    end

    def despace(*fields)
      fields.each do |field|
        define_method "#{field}=" do |value|
          return if value.blank?

          super(value.despacer)
        end
      end
    end
  end
end