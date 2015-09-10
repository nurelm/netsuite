module NetSuite
  module Records
    class TransferOrder
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranInvt

      actions :get, :add, :initialize, :delete, :update, :search

      fields :alt_shipping_cost, :created_date, :fob, :handling_tax1_rate, :handling_tax2_rate,
        :last_modified_date, :linked_tracking_numbers, :memo, :ship_address, :ship_complete,
        :ship_date, :shipping_cost, :shipping_tax1_rate, :shipping_tax2_rate, :source,
        :status, :tracking_numbers, :tran_date, :tran_id

      field :transaction_ship_address, ShipAddress
      field :item_list,                TransferOrderItemList
      field :custom_field_list,        CustomFieldList

      read_only_fields :sub_total, :total

      record_refs :custom_form, :department, :employee, :handling_tax_code, :location,
        :ship_address_list, :ship_method, :shipping_tax_code, :subsidiary, :transfer_location

      attr_reader :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
