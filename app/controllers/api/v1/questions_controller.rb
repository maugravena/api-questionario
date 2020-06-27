module Api
  module V1
    class QuestionsController < ApiController
      def create
        @question = Question.create!(question_params)
        render json: {question: @question}, status: :created
      end

      private

      def question_params
        params.require(:question).permit(:description, :points, :quiz_id, answers_attributes: [:id, :description, :correct])
      end
    end
  end
end
