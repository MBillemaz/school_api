require 'test_helper'

feature "Authentication" do

    describe "#create" do 
        it "logs_in @user with valide email + password" do
        
            user = User.create!(
                email: "user_1@domain.com",
                password: "password123",
                password_confirmation: "password123"
            )

            post api_v1_user_session_path, {
                email: user.email,
                password: user.password
            }

            assert_equal 200, last_response.status
            assert_equal false, json_response['auth_token'].blank?
        end

        it "logs_in user with invalid password" do

            user = User.create!(
                email: "user_1@domain.com",
                password: "password123",
                password_confirmation: "password123"
            )

            post api_v1_user_session_path, {
                email: user.email,
                password: "tagada"
            }

            assert_equal 401, last_response.status
            assert_equal true, json_response['auth_token'].blank?
        end
    end
end 
