require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
	login_user

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end
# This should return the minimal set of attributes required to create a valid
  # group. As you add validations to group, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
     {headline: 'updated_first_name', description: 'updated_last_name', topic: "Topic", category_id: 1 }
  }

  let(:invalid_attributes) {
    {headline: 'updated_first_name', description: 'updated_last_name', topic: "Topic"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # groupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all groups as @groups" do
      group = Group.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:groups)).to eq([group])
    end
  end

  describe "GET #show" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :show, {:id => group.to_param}, valid_session
      expect(assigns(:group)).to eq(group)
    end
  end

  describe "GET #new" do
    it "assigns a new group as @group" do
      get :new, {}, valid_session
      expect(assigns(:group)).to be_a_new(Group)
    end
  end

  describe "GET #edit" do
    it "assigns the requested group as @group" do
      group = Group.create! valid_attributes
      get :edit, {:id => group.to_param}, valid_session
      expect(assigns(:group)).to eq(group)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Group" do
        expect {
          post :create, {:group => valid_attributes}, valid_session
        }.to change(Group, :count).by(1)
      end

      it "assigns a newly created group as @group" do
        post :create, {:group => valid_attributes}, valid_session
        expect(assigns(:group)).to be_a(Group)
        expect(assigns(:group)).to be_persisted
      end

      it "redirects to the created group" do
        post :create, {:group => valid_attributes}, valid_session
        expect(response).to redirect_to(Group.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved group as @group" do
        post :create, {:group => invalid_attributes}, valid_session
        expect(assigns(:group)).to be_a_new(Group)
      end

      it "re-renders the 'new' template" do
        post :create, {:group => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => new_attributes}, valid_session
        group.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested group as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
        expect(assigns(:group)).to eq(group)
      end

      it "redirects to the group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => valid_attributes}, valid_session
        expect(response).to redirect_to(group)
      end
    end

    context "with invalid params" do
      it "assigns the group as @group" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => invalid_attributes}, valid_session
        expect(assigns(:group)).to eq(group)
      end

      it "re-renders the 'edit' template" do
        group = Group.create! valid_attributes
        put :update, {:id => group.to_param, :group => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested group" do
      group = Group.create! valid_attributes
      expect {
        delete :destroy, {:id => group.to_param}, valid_session
      }.to change(Group, :count).by(-1)
    end

    it "redirects to the groups list" do
      group = Group.create! valid_attributes
      delete :destroy, {:id => group.to_param}, valid_session
      expect(response).to redirect_to(groups_url)
    end
  end
end
