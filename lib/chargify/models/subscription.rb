# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength, Naming/VariableNumber, Metrics/BlockLength
module Chargify
  Subscription = Class.new(OpenStruct)

  SubscriptionBankAccount = Class.new(OpenStruct)

  SubscriptionCreditCard = Class.new(OpenStruct)

  SubscriptionCustomer = Class.new(OpenStruct)

  SubscriptionGroup = Class.new(OpenStruct)

  SubscriptionProduct = Class.new(OpenStruct)

  SubscriptionProductFamily = Class.new(OpenStruct)

  SubscriptionProductPublicSignupPages = Class.new(OpenStruct)

  class SubscriptionRepresenter < Representable::Decorator
    include Representable::JSON

    property :activated_at
    property :automatically_resume_at
    property :balance_in_cents
    property :bank_account, class: SubscriptionBankAccount do
      property :bank_account_holder_type
      property :bank_account_type
      property :bank_name
      property :billing_address
      property :billing_address_2
      property :billing_city
      property :billing_country
      property :billing_state
      property :billing_zip
      property :chargify_token
      property :current_vault
      property :customer_id
      property :customer_vault_token
      property :first_name
      property :gateway_handle
      property :id
      property :last_name
      property :masked_bank_account_number
      property :masked_bank_routing_number
      property :site_gateway_setting_id
      property :vault_token
    end
    property :cancel_at_end_of_period
    property :canceled_at
    property :cancellation_message
    property :cancellation_method
    property :coupon_code
    collection :coupon_codes
    property :coupon_use_count
    property :coupon_uses_allowed
    property :created_at
    property :credit_card, class: SubscriptionCreditCard do
      property :billing_address
      property :billing_address_2
      property :billing_city
      property :billing_country
      property :billing_state
      property :billing_zip
      property :card_type
      property :chargify_token
      property :current_vault
      property :customer_id
      property :customer_vault_token
      property :disabled
      property :expiration_month
      property :expiration_year
      property :first_name
      property :gateway_handle
      property :id
      property :last_name
      property :masked_card_number
      property :payment_type
      property :site_gateway_setting_id
      property :vault_token
    end
    property :currency
    property :current_billing_amount_in_cents
    property :current_period_ends_at
    property :current_period_started_at
    property :customer, class: SubscriptionCustomer do
      property :address
      property :address_2
      property :cc_emails
      property :city
      property :country
      property :country_name
      property :created_at
      property :default_subscription_group_uid
      property :email
      property :first_name
      property :id
      property :last_name
      property :locale
      property :organization
      property :parent_id
      property :phone
      property :portal_customer_created_at
      property :portal_invite_last_accepted_at
      property :portal_invite_last_sent_at
      property :reference
      property :state
      property :state_name
      property :tax_exempt
      property :updated_at
      property :vat_number
      property :verified
      property :zip
    end
    property :delayed_cancel_at
    property :expires_at
    property :id
    property :group, class: SubscriptionGroup do
      property :primary
      property :primary_subscription_id
      property :scheme
      property :uid
    end
    property :net_terms
    property :next_assessment_at
    property :next_product_handle
    property :next_product_id
    property :next_product_price_point_id
    property :offer_id
    property :on_hold_at
    property :payer_id
    property :payment_collection_method
    property :payment_type
    property :prepaid_dunning
    property :previous_state
    property :product, class: SubscriptionProduct do
      property :accounting_code
      property :archived_at
      property :created_at
      property :default_product_price_point_id
      property :description
      property :expiration_interval
      property :expiration_interval_unit
      property :handle
      property :id
      property :initial_charge_after_trial
      property :initial_charge_in_cents
      property :interval
      property :interval_unit
      property :name
      property :price_in_cents
      property :product_family, class: SubscriptionProductFamily do
        property :accounting_code
        property :created_at
        property :description
        property :handle
        property :id
        property :name
        property :updated_at
      end
      property :product_price_point_handle
      property :product_price_point_id
      property :product_price_point_name
      collection :public_signup_pages, class: SubscriptionProductPublicSignupPages do
        property :id
        property :return_params
        property :return_url
        property :url
      end
      property :request_billing_address
      property :request_credit_card
      property :require_billing_address
      property :require_credit_card
      property :require_shipping_address
      property :return_params
      property :tax_code
      property :taxable
      property :trial_interval
      property :trial_interval_unit
      property :trial_price_in_cents
      property :update_return_params
      property :update_return_url
      property :updated_at
      property :version_number
    end
    property :product_price_in_cents
    property :product_price_point_id
    property :product_price_point_type
    property :product_version_number
    property :reason_code
    property :receives_invoice_emails
    property :reference
    property :referral_code
    property :scheduled_cancellation_at
    property :signup_payment_id
    property :signup_revenue
    property :snap_day
    property :state
    property :stored_credential_transaction_id
    property :total_revenue_in_cents
    property :trial_ended_at
    property :trial_started_at
    property :updated_at
  end
end

# rubocop:enable Metrics/ClassLength, Naming/VariableNumber, Metrics/BlockLength
