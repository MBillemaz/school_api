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

        it "should return a two object arrays of school" do
            get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal JSON.parse(json_response['message']).length, 2
        end

    end
end