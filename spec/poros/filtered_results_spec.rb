require 'rails_helper'

RSpec.describe FilteredResults do
  it "returns FilteredResults object with expected attributes" do
    data = {:id=>"211lemoyne-61545",
      :type=>"data",
      :attributes=>
      {:category=>"healthcare",
        :provider_name=>"INFORMATION ON SJOGREN'S SYNDROME",
        :street=>"10701 Parkridge Boulevard, Suite 170",
        :city=>"Reston",
        :state=>"VA",
        :lat=>"38.944657",
        :lon=>"-77.314382",
        :description=>"Provides the most up-to-date information about Sjogren's syndrome to patients and healthcare providers."
      }
    }
    keyword = "healthcare"
    filtered_results = FilteredResults.new(data, keyword)

    expect(filtered_results).to be_a(FilteredResults)
    expect(filtered_results.id).to eq("211lemoyne-61545")
    expect(filtered_results.category).to eq("healthcare")
    expect(filtered_results.provider_name).to eq("INFORMATION ON SJOGREN'S SYNDROME")
    expect(filtered_results.street).to eq("10701 Parkridge Boulevard, Suite 170")
    expect(filtered_results.city).to eq("Reston")
    expect(filtered_results.state).to eq("VA")
    expect(filtered_results.lat).to eq("38.944657")
    expect(filtered_results.lon).to eq("-77.314382")
    expect(filtered_results.description).to include("Provides the most up-to-date")
  end
end