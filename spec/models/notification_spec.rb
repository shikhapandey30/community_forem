require "rails_helper"

describe Notification do
  describe "Notification associaties with following models" do
    it "It should belong_to recepient" do 
     should belong_to(:user).class_name('User')
    end
    it "It should belong_to user" do 
      should belong_to(:user)
    end
    it "It should belongs_to notification" do 
      should belong_to(:notificable)
    end
  end
end