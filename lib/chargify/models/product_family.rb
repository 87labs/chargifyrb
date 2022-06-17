# frozen_string_literal: true

module Chargify
  ProductFamily = Class.new(OpenStruct)

  class ProductFamilyRepresenter < Representable::Decorator
    include Representable::JSON

    property :accounting_code
    property :created_at
    property :description
    property :handle
    property :id
    property :name
    property :updated_at
  end
end
