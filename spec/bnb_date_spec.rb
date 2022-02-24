require_relative '../lib/bnb_date'

describe BnbDate do
  it "creates a bnb date" do
  
  bnb_date = BnbDate.create(date: "23-02-2022")

  persisted_date = BnbDate.find(date_id: bnb_date.date_id)

  expect(persisted_date.date).to eq bnb_date.date
  end
end