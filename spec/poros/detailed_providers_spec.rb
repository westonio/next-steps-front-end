require "rails_helper"

RSpec.describe DetailedProvider, type: :poros do
  describe "Instance Methods" do
    it "should take an API result and filter for our needed information" do
      symbolized_data = {:idOrganization=>"211contrac-213",
                        :name=>"DAVITA HEALTHCARE PARTNERS",
                        :alternateName=>nil,
                        :description=>
                        "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                        :url=>"http://www.davita.com",
                        :taxStatus=>nil,
                        :taxId=>"None",
                        :yearIncorporated=>nil,
                        :legalStatus=>"For Profit",
                        :services=>
                        [{:idService=>"211contrac-1561",
                          :idOrganization=>"211contrac-213",
                          :name=>"DAVITA HEALTHCARE PARTNERS (DIALYSIS CENTERS)",
                          :alternateName=>nil,
                          :description=>
                            "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                          :email=>nil,
                          :url=>"http://www.davita.com",
                          :status=>"active",
                          :applicationProcess=>"Call for information or use website to locate dialysis clinics by city and/or zip code",
                          :waitTime=>nil,
                          :fees=>"Varies, according to health plan.",
                          :accreditations=>nil,
                          :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                          :language=>"English only",
                          :eligibility=>"Anyone in need of dialysis",
                          :document=>"None",
                          :contact=>[],
                          :phone=>[{:idPhone=>"8996837316245339326", :number=>"(800) 244-0680", :extension=>nil, :type=>"main number", :description=>nil, :name=>nil}],
                          :category=>nil,
                          :serviceAtLocation=>[{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"}],
                          :temporaryMessage=>nil,
                          :createdOn=>nil,
                          :lastUpdated=>nil,
                          :lastVerified=>nil}],
                        :locations=>
                        [{:idLocation=>"211contrac-1617",
                          :name=>"DAVITA HEALTHCARE PARTNERS",
                          :alternateName=>nil,
                          :description=>
                            "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient d
                      ialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                          :transportation=>nil,
                          :latitude=>"39.753627",
                          :longitude=>"-105.003635",
                          :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                          :address=>
                            [{:idAddress=>"2509270918712944620",
                              :type=>"physical",
                              :address_1=>"2000 16th Street",
                              :address_2=>nil,
                              :city=>"Denver",
                              :region=>"Denver",
                              :state_province=>"CO",
                              :zipcode=>"80202",
                              :country=>"United States"}],
                          :accessibility=>nil,
                          :language=>nil,
                          :phone=>
                            [{:idPhone=>"4429686088590907983", :number=>"(800) 424-6589", :extension=>nil, :type=>"Backdoor Number", :description=>nil, :name=>nil},
                            {:idPhone=>"6719860891525450389", :number=>"(800) 244-0680", :extension=>nil, :type=>"Main Number", :description=>nil, :name=>nil}],
                          :serviceAtLocation=>
                            [{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"},
                            {:idServiceAtLocation=>"211contrac-1562", :idLocation=>"211contrac-1617", :idService=>"211contrac-1562"}]}],
                        :source=>"211 Contra Costa",
                      }

        provider = DetailedProvider.new(symbolized_data)

        expect(provider.id).to eq("211contrac-213")
        expect(provider.name).to eq("DAVITA HEALTHCARE PARTNERS")
        expect(provider.description).to eq("Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.")
        expect(provider.street).to eq("2000 16th Street")
        expect(provider.street2).to eq("Not Available")
        expect(provider.city).to eq("Denver")
        expect(provider.state).to eq("CO")
        expect(provider.zipcode).to eq("80202")
        expect(provider.lat).to eq("39.753627")
        expect(provider.lon).to eq("-105.003635")
        expect(provider.website).to eq("http://www.davita.com")
        expect(provider.phone).to eq("(800) 244-0680")
        expect(provider.fees).to eq("Varies, according to health plan.")
        expect(provider.schedule).to eq("Monday-Friday, 5am-6:30pm; Saturday: 7-11am")
    end

    it 'can get the phone number from the services' do
      symbolized_data = {:idOrganization=>"211contrac-213",
                          :name=>"DAVITA HEALTHCARE PARTNERS",
                          :alternateName=>nil,
                          :description=>
                          "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                          :url=>"http://www.davita.com",
                          :taxStatus=>nil,
                          :taxId=>"None",
                          :yearIncorporated=>nil,
                          :legalStatus=>"For Profit",
                          :services=>
                          [{:idService=>"211contrac-1561",
                            :idOrganization=>"211contrac-213",
                            :name=>"DAVITA HEALTHCARE PARTNERS (DIALYSIS CENTERS)",
                            :alternateName=>nil,
                            :description=>
                              "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                            :email=>nil,
                            :url=>"http://www.davita.com",
                            :status=>"active",
                            :applicationProcess=>"Call for information or use website to locate dialysis clinics by city and/or zip code",
                            :waitTime=>nil,
                            :fees=>"Varies, according to health plan.",
                            :accreditations=>nil,
                            :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                            :language=>"English only",
                            :eligibility=>"Anyone in need of dialysis",
                            :document=>"None",
                            :contact=>[],
                            :phone=>[{:idPhone=>"8996837316245339326", :number=>"(800) 244-0680", :extension=>nil, :type=>"main number", :description=>nil, :name=>nil}],
                            :category=>nil,
                            :serviceAtLocation=>[{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"}],
                            :temporaryMessage=>nil,
                            :createdOn=>nil,
                            :lastUpdated=>nil,
                            :lastVerified=>nil}],
                          :locations=>
                          [{:idLocation=>"211contrac-1617",
                            :name=>"DAVITA HEALTHCARE PARTNERS",
                            :alternateName=>nil,
                            :description=>
                              "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient d
                        ialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                            :transportation=>nil,
                            :latitude=>"39.753627",
                            :longitude=>"-105.003635",
                            :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                            :address=>
                              [{:idAddress=>"2509270918712944620",
                                :type=>"physical",
                                :address_1=>"2000 16th Street",
                                :address_2=>nil,
                                :city=>"Denver",
                                :region=>"Denver",
                                :state_province=>"CO",
                                :zipcode=>"80202",
                                :country=>"United States"}],
                            :accessibility=>nil,
                            :language=>nil,
                            :serviceAtLocation=>
                              [{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"},
                              {:idServiceAtLocation=>"211contrac-1562", :idLocation=>"211contrac-1617", :idService=>"211contrac-1562"}]}],
                          :source=>"211 Contra Costa",
                        }
      provider = DetailedProvider.new(symbolized_data)
              
      expect(provider.phone).to eq("(800) 244-0680")
    end
    it 'can get the phone number from the location' do
      symbolized_data = {:idOrganization=>"211contrac-213",
                          :name=>"DAVITA HEALTHCARE PARTNERS",
                          :alternateName=>nil,
                          :description=>
                          "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                          :url=>"http://www.davita.com",
                          :taxStatus=>nil,
                          :taxId=>"None",
                          :yearIncorporated=>nil,
                          :legalStatus=>"For Profit",
                          :services=>
                          [{:idService=>"211contrac-1561",
                            :idOrganization=>"211contrac-213",
                            :name=>"DAVITA HEALTHCARE PARTNERS (DIALYSIS CENTERS)",
                            :alternateName=>nil,
                            :description=>
                              "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                            :email=>nil,
                            :url=>"http://www.davita.com",
                            :status=>"active",
                            :applicationProcess=>"Call for information or use website to locate dialysis clinics by city and/or zip code",
                            :waitTime=>nil,
                            :fees=>"Varies, according to health plan.",
                            :accreditations=>nil,
                            :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                            :language=>"English only",
                            :eligibility=>"Anyone in need of dialysis",
                            :document=>"None",
                            :contact=>[],
                            :category=>nil,
                            :serviceAtLocation=>[{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"}],
                            :temporaryMessage=>nil,
                            :createdOn=>nil,
                            :lastUpdated=>nil,
                            :lastVerified=>nil}],
                          :locations=>
                          [{:idLocation=>"211contrac-1617",
                            :name=>"DAVITA HEALTHCARE PARTNERS",
                            :alternateName=>nil,
                            :description=>
                              "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient d
                        ialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                            :transportation=>nil,
                            :latitude=>"39.753627",
                            :longitude=>"-105.003635",
                            :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                            :address=>
                              [{:idAddress=>"2509270918712944620",
                                :type=>"physical",
                                :address_1=>"2000 16th Street",
                                :address_2=>nil,
                                :city=>"Denver",
                                :region=>"Denver",
                                :state_province=>"CO",
                                :zipcode=>"80202",
                                :country=>"United States"}],
                            :accessibility=>nil,
                            :language=>nil,
                            :phone=>
                              [{:idPhone=>"4429686088590907983", :number=>"(800) 424-6589", :extension=>nil, :type=>"Backdoor Number", :description=>nil, :name=>nil},
                              {:idPhone=>"6719860891525450389", :number=>"(800) 244-0680", :extension=>nil, :type=>"Main Number", :description=>nil, :name=>nil}],
                            :serviceAtLocation=>
                              [{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"},
                              {:idServiceAtLocation=>"211contrac-1562", :idLocation=>"211contrac-1617", :idService=>"211contrac-1562"}]}],
                          :source=>"211 Contra Costa",
                        }
      provider = DetailedProvider.new(symbolized_data)
              
      expect(provider.phone).to eq("(800) 424-6589")
    end

    it 'returns message if number is not available' do
      symbolized_data = {:idOrganization=>"211contrac-213",
                          :name=>"DAVITA HEALTHCARE PARTNERS",
                          :alternateName=>nil,
                          :description=>
                          "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                          :url=>"http://www.davita.com",
                          :taxStatus=>nil,
                          :taxId=>"None",
                          :yearIncorporated=>nil,
                          :legalStatus=>"For Profit",
                          :services=>
                          [{:idService=>"211contrac-1561",
                            :idOrganization=>"211contrac-213",
                            :name=>"DAVITA HEALTHCARE PARTNERS (DIALYSIS CENTERS)",
                            :alternateName=>nil,
                            :description=>
                              "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient dialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                            :email=>nil,
                            :url=>"http://www.davita.com",
                            :status=>"active",
                            :applicationProcess=>"Call for information or use website to locate dialysis clinics by city and/or zip code",
                            :waitTime=>nil,
                            :fees=>"Varies, according to health plan.",
                            :accreditations=>nil,
                            :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                            :language=>"English only",
                            :eligibility=>"Anyone in need of dialysis",
                            :document=>"None",
                            :contact=>[],
                            :category=>nil,
                            :serviceAtLocation=>[{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"}],
                            :temporaryMessage=>nil,
                            :createdOn=>nil,
                            :lastUpdated=>nil,
                            :lastVerified=>nil}],
                          :locations=>
                          [{:idLocation=>"211contrac-1617",
                            :name=>"DAVITA HEALTHCARE PARTNERS",
                            :alternateName=>nil,
                            :description=>
                              "Provides dialysis services for those diagnosed with chronic kidney failure, a condition also known as chronic kidney disease (CKD). Provides locations of over 2,000 outpatient d
                        ialysis facilities and acute units in over 800 hospitals 46 states and the District of Columbia. Website offers extensive information about CKD.",
                            :transportation=>nil,
                            :latitude=>"39.753627",
                            :longitude=>"-105.003635",
                            :schedule=>"Monday-Friday, 5am-6:30pm; Saturday: 7-11am",
                            :address=>
                              [{:idAddress=>"2509270918712944620",
                                :type=>"physical",
                                :address_1=>"2000 16th Street",
                                :address_2=>nil,
                                :city=>"Denver",
                                :region=>"Denver",
                                :state_province=>"CO",
                                :zipcode=>"80202",
                                :country=>"United States"}],
                            :accessibility=>nil,
                            :language=>nil,
                            :serviceAtLocation=>
                              [{:idServiceAtLocation=>"211contrac-1561", :idLocation=>"211contrac-1617", :idService=>"211contrac-1561"},
                              {:idServiceAtLocation=>"211contrac-1562", :idLocation=>"211contrac-1617", :idService=>"211contrac-1562"}]}],
                          :source=>"211 Contra Costa",
                        }

      provider = DetailedProvider.new(symbolized_data)

      expect(provider.phone).to eq("Not Available")
    end
  end
end