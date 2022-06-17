# frozen_string_literal: true

module Chargify
  class Client
    module Products
      def read_product(id)
        response = get %(products/#{id})
        response.product
      end

      def read_product_by_handle(handle)
        response = get %(products/handle/#{handle})
        response.product
      end
    end
  end
end
