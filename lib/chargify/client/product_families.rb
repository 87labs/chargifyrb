# frozen_string_literal: true

module Chargify
  class Client
    module ProductFamilies
      # The product family can be specified either with the id number, or with the handle:my-family format.
      def read_product_family(id)
        response = get %(product_families/#{id})
        response.product_family
      end
    end
  end
end
