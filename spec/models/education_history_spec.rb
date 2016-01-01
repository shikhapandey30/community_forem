require "rails_helper"

describe EducationHistory do
  describe "EducationHistory associaties with following models" do
    it { should belong_to(:course) }
    it { should belong_to(:institute) }
    it { should belong_to(:specialization) }
    it { should belong_to(:user) }
  end
end