class Api::V1::SchoolsController < Api::ApiController

    # api :GET, '/v1/schools', 'Liste des écoles'
    def index
        @message = "hello"
    end
end