require "rails_helper"

describe NotificationSetting do
  describe "NotificationSetting associaties with following models" do
    it "It should belong_to user" do 
     should belong_to(:user) 
    end
  end
end