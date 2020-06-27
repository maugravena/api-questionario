module Api
  module V1
    class UsersController < ApiController
      def create
        @user = User.create!(user_params)
        render json: { user: @user.name }, status: :created
      end

      private

      def user_params
        params.permit(:name, :email)
      end
    end
  end
end
