require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  before(:each) do
    @blog = assign(:blog, Blog.create!(
      :name => "MyString",
      :description => "MyText",
      :image => "MyString",
      :user_id => 1,
      :slug => "MyString"
    ))
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do

      assert_select "input#blog_name[name=?]", "blog[name]"

      assert_select "textarea#blog_description[name=?]", "blog[description]"

      assert_select "input#blog_image[name=?]", "blog[image]"

      assert_select "input#blog_user_id[name=?]", "blog[user_id]"

      assert_select "input#blog_slug[name=?]", "blog[slug]"
    end
  end
end
