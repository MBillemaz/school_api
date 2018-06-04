class School < ApplicationRecord
    
    validates :name, presence: true
    validates :mail, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, :allow_blank => true
    before_save :format_lat_lng

    def self.filter(params)
        out = []
        if params[:status].blank?
            out = School.all
        else
            out = School.where(['status = ?', params[:status]])
        end
        return out.order(name: :asc)
    end

    private
    def format_lat_lng
        self.latitude = latitude.to_f
        self.longitude = longitude.to_f
    end

end