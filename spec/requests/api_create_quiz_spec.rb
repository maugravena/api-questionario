require 'rails_helper'

describe 'api user create new quiz' do
  it 'succesfully' do
    user = User.create(name: 'Teste', email: 'teste@teste.com')

    post api_v1_user_quizzes_path(user),
         params: { name: 'teste',
                   description: 'Uma descrição para questionário',
                   limit_time: 15 }

    json_client = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status 201
    expect(json_client[:name]).to eq 'teste'
    expect(user.quizzes.ids).to include json_client[:id]
  end

  it 'and request must have all attributes' do
    user = User.create(name: 'Teste', email: 'teste@teste.com')

    post api_v1_user_quizzes_path(user),
         params: { name: '', description: '', limit_time: nil }

    json_client = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status 412
    expect(json_client[:message]).to eq 'A validação falhou: Name não pode ficar em branco, Description não pode ficar em branco, Limit time não pode ficar em branco'
  end

  it 'and the name must be unique' do
    user = User.create(name: 'Teste', email: 'teste@teste.com')
    Quiz.create(name: 'Novo questionário',
                description: 'Questionário para novas perguntas',
                limit_time: 10, user_id: user.id)

    post api_v1_user_quizzes_path(user),
         params: { name: 'Novo questionário',
                   description: 'Vai da ruim', limit_time: 15 }

    json_client = JSON.parse(response.body, symbolize_names: true)

    error_message = 'A validação falhou: Name já está em uso'
    expect(response).to have_http_status 412
    expect(json_client[:message]).to eq error_message
  end
end
