require "rails_helper"

RSpec.describe "FilteredProvider", type: :poros do
  describe "initialize" do
    it "should take an API result and filter for our needed information" do
      raw_data = {
        "document": {
          "id": "306356",
          "idServiceAtLocation": "211colorad-a0h4T000002u0xmQAA",
          "idService": "211colorad-a0E4T000000NigKUAS",
          "idOrganization": "211colorad-0014T000004o6MdQAI",
          "idLocation": "211colorad-a014T000003RAVbQAO",
          "nameService": "TEMPORARY SHELTER FOR PETS",
          "descriptionService": "Offers 2 to 4 weeks of shelter for pets of families experiencing temporary homelessness due to fire, domestic violence, or hospitalization. Also provides this service to pet owners experiencing homelessness during severe cold weather (15 degrees or below).This location also offers:AdoptionSafe havenVolunteer opportunitiesLicensingEuthanasiaVaccine clinic",
          "nameOrganization": "DENVER ANIMAL PROTECTION",
          "descriptionOrganization": "Provides services relating to animal welfare.",
          "nameLocation": nil,
          "latitudeLocation": "39.715260",
          "longitudeLocation": "-105.003082",
          "address1PhysicalAddress": "1241 W Bayaud Ave",
          "cityPhysicalAddress": "Denver",
          "regionPhysicalAddress": "Denver County",
          "statePhysicalAddress": "CO",
          "countryPhysicalAddress": "United States",
          "taxonomyTerm": [
            "Animal Shelters",
            "Foster Care/Temporary Shelter for Animals"
          ],
          "taxonomyCode": [
            "PD-7600.0600",
            "PD-7600.2100"
          ],
          "taxonomyCodeForSearch": [
            "PD76000600",
            "PD76002100"
          ],
          "topicTaxonomy": [
            "Individual and Family Life"
          ],
          "subtopicTaxonomy": [
            "Domestic Animal Services"
          ],
          "topicOwner": "AIRS211LA",
          "dataOwner": "211 Colorado",
          "serviceArea": [
            "Denver"
          ],
          "tags": [
            ""
          ]
        }
      }
      filtered_data = FilteredProvider.new(raw_data, "healthcare")

      expect(filtered_data.id).to eq("211colorad-a0h4T000002u0xmQAA")
      expect(filtered_data.provider_name).to eq("TEMPORARY SHELTER FOR PETS")
      expect(filtered_data.street).to eq("1241 W Bayaud Ave")
      expect(filtered_data.city).to eq("Denver")
      expect(filtered_data.state).to eq("CO")
      expect(filtered_data.lat).to eq("39.715260")
      expect(filtered_data.lon).to eq("-105.003082")
      expect(filtered_data.description).to include("Offers 2 to 4 weeks of shelter for pets of families experiencing temporary homelessness due to fire,")
      expect(filtered_data.category).to eq("healthcare")
    end
  end
end
