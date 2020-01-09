require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: {  id: 1 }
      expect(response).to render_template :show
    end
  end
  



end