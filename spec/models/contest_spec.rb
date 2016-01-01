require "rails_helper"

describe Contest do
  describe "Contest associaties with following models" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:members).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:dislikes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:followings).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_one(:upload).dependent(:destroy) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:visibility) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:description) }
    # it {should validate_length_of(:topic).is_at_most(80)}
    # it {should validate_length_of(:headline).is_at_most(80)}
    # it {should validate_length_of(:description).is_at_most(80)}
  end
end