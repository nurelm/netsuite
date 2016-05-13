module NetSuite
  module Records
    class PromotionCode
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::ListMkt

      actions :get, :add, :initialize, :delete, :update, :search

      fields :name, :code, :description, :rate, :start_date, :end_date, :discount_type,
       :exclude_items, :display_line_discounts, :is_inactive, :is_public, :use_type, :apply_discount_to

      field :custom_field_list,        CustomFieldList

      record_refs :discount

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end



