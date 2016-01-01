require "rails_helper"

describe Message do
  describe "Message associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
    it "It should belong_to conversation" do 
      should belong_to(:conversation)
    end
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of body, conversation_id, user_id" do
      should validate_presence_of(:body)
      should validate_presence_of(:conversation_id) 
      should validate_presence_of(:user_id) 
    end
  end
end