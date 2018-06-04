class Api::V1::SchoolsController < Api::ApiController

    api :GET, '/v1/schools', 'Liste des écoles'
    def index
        @schools = School.all
        status = params[:status]
        if status != nil
            @schools = School.where(['status = ?', params[:status]]) 
        end

        @schools = School.filter(params)
        render 'api/v1/schools/index.json'
        # format.json render 'api/v1/schools/index.json'
    end

    # api :POST, '/v1/schools', 'Créer une nouvelle école'
    # params: school: {
    #     name 
    #     address
    #     postal_code
    #     commune
    #     horaire
    #     phone_number
    #     mail
    #     latitude
    #     longitude 
    #     nb_student
    #     status
    # }
    def create

        @school = School.create(school_params)

        if @school.save
            render :show, status: 201
        else
            render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
        end

    end

    #api :SHOW '/v1/schools', 'Afficher une école"
    #params: id
    def show
        @school = School.find(params[:id])
    end

    #api :DELETE '/v1/schools', 'Supprimer une école"
    #params: id
    def destroy
        School.delete(params[:id])
        render json: {success: true}, status: 200
    end

    #api :PATCH/PUT '/v1/schools', 'Modifier une école"
    #params: id
    #paramêtre supplémentaire: School
    def update
        @school = School.find(params[:id])
        school_params.each do |param|
            @school[param] = school_params[param]
        end
        @school.save
        render :show
    end

private
    def school_params
        params.require(:school)
        .permit(
            :id,
            :name,
            :address,
            :postal_code,
            :commune,
            :horaire,
            :phone_number,
            :mail,
            :latitude,
            :longitude,
            :nb_student,
            :status
        )
    end
end