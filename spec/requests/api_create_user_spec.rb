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
    json_client = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status 412
    expect(json_client[:message]).to eq 'A validação falhou: Name não pode ficar em branco, Email não pode ficar em branco'
  end
end
