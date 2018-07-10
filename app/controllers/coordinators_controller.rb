class CoordinatorsController < ApplicationController
    def home 
        if session[:coordinator_id]
            redirect_to "/registries"
        end 
    end 
    
    def index
        @coordinators = Coordinator.all
    end 
    
    def create 
        @coordinator = Coordinator.new(coordinator_params)
        if @coordinator.save 
            session[:coordinator_id] = @coordinator.id
            redirect_to "/registries"
        else 
            flash[:errors] = @coordinator.errors.full_messages
            redirect_to :back
        end 
    end

    def login
        @coordinator = Coordinator.find_by_email(params[:email])
        if @coordinator.nil?
            flash[:errors] = "Coordinator Not Found"
            redirect_to :back
        else 
            session[:coordinator_id] = @coordinator.id 
            redirect_to "/registries"
        end     
    end 
    
    def show
        @coordinator = Coordinator.find(params[:coordinator_id])
    end

    def logout
        reset_session
        redirect_to "/"
    end     
    
    private 
        def coordinator_params
            params.require(:coordinator).permit(:email, :name, :phone_number)
        end
end
