# frozen_string_literal: true

module Chargify
  class Client
    module Coupons
      def find_coupon(code, product_family_id = nil)
        params = { code: code }
        params[:product_family_id] = product_family_id if product_family_id

        response = get "coupons/find", params
        response.coupon
      end

      def validate_coupon(code, product_family_id = nil)
        params = { code: code }
        params[:product_family_id] = product_family_id if product_family_id

        response = get "coupons/validate", params
        response.coupon
      end
    end
  end
end
