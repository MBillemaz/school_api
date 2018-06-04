class School < ApplicationRecord
    
    validates :name, presence: true

    def self.filter(params)
        out = []
        if params[:status].blank?
            out = School.all
        else
            out = School.where(['status = ?', params[:status]])
        end
        return out.order(name: :asc)
    end
end