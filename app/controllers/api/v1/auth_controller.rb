# app/controllers/api/v1/auth_controller.rb
module Api
    module V1
      class AuthController < ApplicationController
        def signup
          user = User.new(user_params)
          if user.save
            render json: { message: 'ユーザー登録成功', user: user }, status: :created
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def login
          user = User.find_by(email: params[:email])
          if user&.authenticate(params[:password])
            render json: { message: 'ログイン成功', user: user }
          else
            render json: { message: 'ログイン失敗' }, status: :unauthorized
          end
        end
  
        private
  
        def user_params
          params.require(:user).permit(:email, :username, :password, :password_confirmation)
        end
      end
    end
  end
end
  