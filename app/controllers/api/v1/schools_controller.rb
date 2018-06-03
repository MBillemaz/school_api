class Api::V1::SchoolsController < Api::ApiController

    # api :GET, '/v1/schools', 'Liste des écoles'
    def index
        @message = School.all.to_json
        render 'api/v1/schools/index.json'
        # format.json render 'api/v1/schools/index.json'

    end
end