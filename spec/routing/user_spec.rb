require 'rails_helper'

describe 'registration routes' do
  it 'should route to users registration' do
    expect(post('/api/v1/sign_up')).to route_to('api/v1/registrations#create', format: :json)
  end

  it 'should route to users session' do
    expect(post('/api/v1/sign_in')).to route_to('api/v1/sessions#create', format: :json)
  end

  it 'should route to users session destroy' do
    expect(delete('/api/v1/log_out')).to route_to('api/v1/sessions#destroy', format: :json)
  end
end
