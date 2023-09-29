class FilteredProviderSerializer
  include JSONAPI::Serializer

  attributes :category,
              :provider_name,
              :street,
              :city,
              :state,
              :lat,
              :lon,
              :description
end
