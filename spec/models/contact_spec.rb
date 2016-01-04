require "rails_helper"

describe Contact do
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of name, phone_no, email,body" do
      should validate_presence_of(:name)
      should validate_presence_of(:phone_no) 
      should validate_presence_of(:email) 
      should validate_presence_of(:body)
    end
  end
end