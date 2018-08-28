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
    if @registry.coordinators.include?(@coordinator)
      flash[:message] = "Coordinator already exists in registry. Please choose a different coordinator."
    else 
      @registry.coordinators << @coordinator 
    end 
    redirect_to :back
  end 

  def toggle
    @registry = Registry.find(params[:registry_id])
    @registry.toggle!(:open)
    redirect_to :back
  end 

  private 
    def registry_params
      params.require(:registry).permit(:name, :location, :open)
    end 
  end
