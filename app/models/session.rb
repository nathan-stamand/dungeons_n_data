class Session < ApplicationRecord
    belongs_to :campaign

    def find_hours
        @start = params[:session][:start_time].to_time
        @end = params[:session][:end_time].to_time
        @hours = ((@end - @start).to_f/3600).to_f
        self.hours = @hours
    end
    
end
