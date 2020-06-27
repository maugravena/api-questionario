require 'rails_helper'

describe 'api create new user' do
  it 'successfully' do
    post api_v1_users_path, params: { name: 'Mauricio', email: 'mau@email.com' }
    json_client = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 201
    expect(json_client[:user]).to eq 'Mauricio'
  end

  it 'and request must have all attributes' do
    post api_v1_users_path, params: { name: '', email: '' }
    expect(response).to have_http_status 412
  end
end
