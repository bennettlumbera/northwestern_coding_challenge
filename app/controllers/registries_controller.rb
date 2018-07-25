class RegistriesController < ApplicationController
  def index
    @registries = Registry.includes(:coordinators)
    @coordinators = Coordinator.all
  end

  def create
    @registry = Registry.new(registry_params)
    if @registry.save
      redirect_to '/registries'
    else 
      flash[:errors] = @registry.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @registry = Registry.find(params[:registry_id])
  end 

  def add_coordinator
     @registry = Registry.find(params[:registry_id])
     @coordinator = Coordinator.find(params[:coordinator])
     @registry.coordinators << @coordinator unless @registry.coordinators.include?(@coordinator)
     redirect_to :back
  end 

  def toggle_open
    @registry = Registry.find(params[:registry_id])
    @registry.toggle!(:open)
    redirect_to :back
  end 

  private 
    def registry_params
      params.require(:registry).permit(:name, :location, :open)
    end 
  end
