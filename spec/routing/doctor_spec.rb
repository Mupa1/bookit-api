require 'rails_helper'

describe 'doctor routes' do
  it 'should route to doctor creation' do
    expect(post('/api/v1/doctors')).to route_to('api/v1/doctors#create', format: :json)
  end

  it 'should route to a specific doctor' do
    expect(get('/api/v1/doctors/1')).to route_to('api/v1/doctors#show', 'id' => '1', format: :json)
  end

  it 'should route to all doctors' do
    expect(get('/api/v1/doctors')).to route_to('api/v1/doctors#index', format: :json)
  end
end
