class EnrollmentsController < ApplicationController
  def new 
    @registries = Coordinator.find(session[:coordinator_id]).registries 
    @participants = Participant.all
  end 

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.coordinator_id = session[:coordinator_id]
    if @enrollment.save 
      flash[:success] = "Successfully enrolled participant."
      redirect_to :back
    else 
      flash[:errors] = @enrollment.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @enrollment = Enrollment.find_by(participant_id: params[:participant_id], registry_id: params[:registry_id]).destroy
    puts @enrollment
    redirect_to :back
  end  

  private 
    def enrollment_params
      params.require(:enrollment).permit(:date_of_enrollment, :method_of_contact, :remarks, :participant_id, :registry_id)
    end
end
