class DndSession < ApplicationRecord
    belongs_to :campaign

    def find_hours(params)
        @start = params[:dnd_session][:start_time].to_time
        @end = params[:dnd_session][:end_time].to_time
        @hours = ((@end - @start).to_f/3600).to_f.round(2)
        self.hours = @hours.to_s
    end

end
