require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  include Devise::Test::ControllerHelpers
  setup do
    @user = FactoryBot.create(:user)
    @dashboard = FactoryBot.create(:dashboard, user: @user)
  end

  it 'should redirect unauthenticated user to sign in' do
    sign_in nil
    get :index
    expect(response).to redirect_to(new_user_session_path)
  end

  it 'should get dashboards page' do
    sign_in @user
    get :index
    expect(response).to be_success
  end

  it 'should get new dashboard page' do
    sign_in @user
    get :new
    expect(response).to be_success
  end

  it 'deletes the dashboard' do
    sign_in @user
    delete :destroy, params: {id: @dashboard.id, user_id: @user.id}
    expect(response).to redirect_to(dashboards_path)
  end

  it 'shows dashboard' do
    sign_in @user
    get :show , params: {id: @dashboard.id, user_id: @user.id}
    expect(response.status).to eq(200)
  end

  it 'updates dahsboard' do
    db_params = FactoryBot.attributes_for(:dashboard)
    sign_in @user
    patch :update , params: {id: @dashboard.id, dashboard: db_params}
    expect(response.status).to eq(302)
  end

  it 'creates dashboards' do
    db_params = FactoryBot.attributes_for(:dashboard)
    sign_in @user
    post :create , params: {dashboard: db_params}
    expect(response).to redirect_to(dashboards_path)
  end
end


