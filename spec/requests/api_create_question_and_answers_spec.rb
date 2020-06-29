require 'rails_helper'

describe 'api create new question and answers' do
  it 'successfully' do
    user = User.create(name: 'Teste', email: 'teste@email.com')
    quiz = Quiz.create(name: 'Novo questionário',
                       description: 'Questionário para novas perguntas',
                       limit_time: 10, user_id: user.id)

    post api_v1_quiz_questions_path(quiz),
         params: { question: { quiz_id: quiz.id,
                               description: 'Qual a origem da vida?',
                               points: 100,
                               answers_attributes: [
                                 { description: 'Ninguém sabe', correct: true },
                                 { description: 'Eu sei', correct: false }
                               ] } }

    json_client = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status 201
    expect(json_client[:question][:description]).to eq 'Qual a origem da vida?'
    expect(quiz.questions.ids).to include json_client[:question][:id]
  end

  it 'and request must have all attributes' do
    user = User.create(name: 'Teste', email: 'teste@email.com')
    quiz = Quiz.create(name: 'Novo questionário',
                       description: 'Questionário para novas perguntas',
                       limit_time: 10, user_id: user.id)

    post api_v1_quiz_questions_path(quiz),
         params: { question: { quiz_id: nil, description: '', points: nil,
                               answers_attributes: [
                                 { description: '', correct: nil }
                               ] } }

    json_client = JSON.parse(response.body, symbolize_names: true)

    expect(response).to have_http_status 412
    expect(json_client[:message]).to eq 'A validação falhou: Answers description não pode ficar em branco, Quiz é obrigatório(a), Description não pode ficar em branco, Points não pode ficar em branco'
  end
end
