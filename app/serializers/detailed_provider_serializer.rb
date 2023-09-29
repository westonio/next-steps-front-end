class DetailedProviderSerializer
  include JSONAPI::Serializer

  attributes :id, 
              :name,
              :description,
              :street,
              :street2,
              :city,
              :state,
              :zipcode,
              :lat,
              :lon,
              :website,
              :phone,
              :fees,
              :schedule
end
