require "rails_helper"

describe Conversation do
  describe "Conversation associaties with following models" do
    it "It should belong_to sender (user)" do 
     should belong_to(:sender).class_name('User').with_foreign_key('sender_id')
    end
    it "It should belong_to recipient (user)" do 
      should belong_to(:recipient).class_name('User').with_foreign_key('recipient_id')
    end
    it "It should has many messages" do 
      should have_many(:messages).dependent(:destroy)
    end   
  end
  ## Validation
  describe "validates_presence_of" do 
    it "validate_presence_of category_id, topic, headline, slogan, name" do
      should validate_uniqueness_of(:sender_id).scoped_to(:recipient_id)
    end
  end

  # ##Scope
  #  describe "scopes" do
  #   # It's a good idea to create specs that test a failing result for each scope, but that's up to you
  #   it ".loved returns all Conversations between two users" do      
  #     sender_id = FactoryGirl.create(:user)
  #     # recipient_id = FactoryGirl.create(:user1)             
      
  #     # it "has another scope that works" do
  #     #   expect(User.between(where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id))))
  #     # end
  #   end
  # end
end