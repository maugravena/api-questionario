module Api
  module V1
    class QuizzesController < ApiController
      def create
        @quiz = Quiz.create!(quiz_params)
        render json:  @quiz, status: :created
      end

      private

      def quiz_params
        params.permit(:name, :description, :limit_time, :user_id)
      end
    end
  end
end
