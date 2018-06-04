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

        it "return the list of all schools" do
            get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal 200, last_response.status
            assert_equal json_response['schools'].length, School.count
        end

        it "returns only private schools" do 
            get api_v1_schools_path, {status: "privé"} , {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal 200, last_response.status
            assert_equal json_response['schools'].length, 1
            assert_equal json_response['schools'], JSON.parse([schools(:two)].to_json)
        end
    end

    describe "#create" do
        it "should create new School and return 201" do

            list_params = {
                "name":"Ecole Maternelle Audrey Hepburn",
                "address":"8 Rue Tissot, 69009 Lyon",
                "nb_student":150,
                "status":"public",
                "latitude":45.7766122,
                "longitude":4.80246360000001,
                "mail":"AudreyHepburn@school.com",
                "phone_number":"0432956349",
                "horaire":"Lundi au vendredi: 8h - 19h",
                "commune":"Village Paumé",
                "postal_code":"00000"
            }

            assert_difference "School.count" do 
                post api_v1_schools_path, {
                    "school": list_params
                }, {'HTTP_AUTHORIZATION' => 'valid_token'}
            end


            #On teste que TOUS les parametres ont été acceptés par le strong_parameters
            list_params.each do |key, param| 
                assert_equal param, School.last[key]
            end
        end

        it "should no create new school when no name given" do 
            
            assert_no_difference "School.count" do
                post api_v1_schools_path, {school: {
                    name: ""
                }}, {'HTTP_AUTHORIZATION' => 'valid_token'}
            end

            assert_equal 422, last_response.status
        end

    end

    describe "#show" do

        it "should find one school" do 
            school = schools(:one)

            get api_v1_school_path(school.id), nil, {'HTTP_AUTHORIZATION' => 'valid_token'}


            assert_equal last_response.status, 200
            assert_equal JSON.parse(schools(:one).to_json), json_response['school']
        end
    end

    describe "#delete" do

        it "should delete school by is ID" do 
            school = schools(:one)
            assert_difference "School.count", -1 do
                delete api_v1_school_path(school.id), nil, {'HTTP_AUTHORIZATION' => 'valid_token'}
            end 
            assert_equal last_response.status, 200

        end
    end

    describe "#patch/put" do
        it "should update school by is ID" do 
            school = schools(:one)

            patch api_v1_school_path(school.id), {
                "school": {
                    "mail":"AudreyHepburn@school.com",
                    "phone_number":"0432956349",
                    "horaire":"Lundi au vendredi: 8h - 19h"
                }
            }, {'HTTP_AUTHORIZATION' => 'valid_token'}

            assert_equal last_response.status, 200
            assert_equal json_response['school']['phone_number'], "0432956349"

        end
    end
end