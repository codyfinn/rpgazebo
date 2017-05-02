require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe RuleSetsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RuleSet. As you add validations to RuleSet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RuleSetsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all rule_sets as @rule_sets" do
      rule_set = RuleSet.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:rule_sets)).to eq([rule_set])
    end
  end

  describe "GET #show" do
    it "assigns the requested rule_set as @rule_set" do
      rule_set = RuleSet.create! valid_attributes
      get :show, params: {id: rule_set.to_param}, session: valid_session
      expect(assigns(:rule_set)).to eq(rule_set)
    end
  end

  describe "GET #new" do
    it "assigns a new rule_set as @rule_set" do
      get :new, params: {}, session: valid_session
      expect(assigns(:rule_set)).to be_a_new(RuleSet)
    end
  end

  describe "GET #edit" do
    it "assigns the requested rule_set as @rule_set" do
      rule_set = RuleSet.create! valid_attributes
      get :edit, params: {id: rule_set.to_param}, session: valid_session
      expect(assigns(:rule_set)).to eq(rule_set)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RuleSet" do
        expect {
          post :create, params: {rule_set: valid_attributes}, session: valid_session
        }.to change(RuleSet, :count).by(1)
      end

      it "assigns a newly created rule_set as @rule_set" do
        post :create, params: {rule_set: valid_attributes}, session: valid_session
        expect(assigns(:rule_set)).to be_a(RuleSet)
        expect(assigns(:rule_set)).to be_persisted
      end

      it "redirects to the created rule_set" do
        post :create, params: {rule_set: valid_attributes}, session: valid_session
        expect(response).to redirect_to(RuleSet.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved rule_set as @rule_set" do
        post :create, params: {rule_set: invalid_attributes}, session: valid_session
        expect(assigns(:rule_set)).to be_a_new(RuleSet)
      end

      it "re-renders the 'new' template" do
        post :create, params: {rule_set: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rule_set" do
        rule_set = RuleSet.create! valid_attributes
        put :update, params: {id: rule_set.to_param, rule_set: new_attributes}, session: valid_session
        rule_set.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested rule_set as @rule_set" do
        rule_set = RuleSet.create! valid_attributes
        put :update, params: {id: rule_set.to_param, rule_set: valid_attributes}, session: valid_session
        expect(assigns(:rule_set)).to eq(rule_set)
      end

      it "redirects to the rule_set" do
        rule_set = RuleSet.create! valid_attributes
        put :update, params: {id: rule_set.to_param, rule_set: valid_attributes}, session: valid_session
        expect(response).to redirect_to(rule_set)
      end
    end

    context "with invalid params" do
      it "assigns the rule_set as @rule_set" do
        rule_set = RuleSet.create! valid_attributes
        put :update, params: {id: rule_set.to_param, rule_set: invalid_attributes}, session: valid_session
        expect(assigns(:rule_set)).to eq(rule_set)
      end

      it "re-renders the 'edit' template" do
        rule_set = RuleSet.create! valid_attributes
        put :update, params: {id: rule_set.to_param, rule_set: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rule_set" do
      rule_set = RuleSet.create! valid_attributes
      expect {
        delete :destroy, params: {id: rule_set.to_param}, session: valid_session
      }.to change(RuleSet, :count).by(-1)
    end

    it "redirects to the rule_sets list" do
      rule_set = RuleSet.create! valid_attributes
      delete :destroy, params: {id: rule_set.to_param}, session: valid_session
      expect(response).to redirect_to(rule_sets_url)
    end
  end

end
