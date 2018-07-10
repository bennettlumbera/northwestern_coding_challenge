class ParticipantsController < ApplicationController
    def new     
    end 

    def index
        @participants = Participant.all
    end 

    def create
        @participant = Participant.new(participant_params)
        if @participant.save
            redirect_to "/enrollments/new"
        else 
            flash[:errors] = @participant.errors.full_messages
            redirect_to :back
        end
    end 
    private 
        def participant_params
        params.require(:participant).permit(:name, :gender, :date_of_birth)
        end
end
