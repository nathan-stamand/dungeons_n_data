class DndSession < ApplicationRecord
    belongs_to :campaign
    scope :recently_changed, -> {where("updated_at > ?", Time.now - 2592000)}
    scope :recently_made, -> {where("created_at > ?", Time.now - 2592000)}
    scope :with_notes, -> {where.not(dm_notes: [nil, ''])}

    def find_hours(params)
        @start = params[:dnd_session][:start_time].to_time
        @end = params[:dnd_session][:end_time].to_time
        @hours = ((@end - @start).to_f/3600).to_f.round(2)
        self.hours = @hours.to_s
    end

end
