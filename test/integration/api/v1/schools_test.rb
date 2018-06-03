require 'test_helper'

feature "Schools" do


    describe "#index" do 
        it "returns 401 when user is not authenticated" do
        
            get api_v1_schools_path

            assert_equal 401, last_response.status
        end

        it "returns 401 when auth_token is unknown" do
        
            get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => '12345AZERTY'}

            assert_equal 401, last_response.status
        end

        it "returns 201 when auth_token is known" do
            get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal 200, last_response.status
        end
    end
end

# describe "authentication_success" do 
#     it "access to school controller with a valid token" do
        
#         post api_v1_user_session_path, {
#             email: @user.email,
#             password: @user.password
#         }

#         token = json_response['auth_token']

#         get api_v1_schools_path, {
#             auth_token: token
#         }

#         assert_equal false, json_response['success'].blank?
#     end

#     it "no access to school controller with an invalid token" do
        
#         post api_v1_user_session_path, {
#             email: @user.email,
#             password: @user.password
#         }

#         token = json_response['auth_token']

#         get api_v1_schools_path, {
#             auth_token: "abcdefg"
#         }

#         assert_equal true, json_response['success'].blank?
#     end

#     it "no access to school controller without token" do
        
#         post api_v1_user_session_path, {
#             email: @user.email,
#             password: @user.password
#         }

#         get api_v1_schools_path

#         puts json_response['errors'].to_json
#         assert_equal true, json_response['success'].blank?
#     end