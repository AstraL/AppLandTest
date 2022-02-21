class AppmapsController < ApplicationController
  before_action :set_appmap, only: %i[ show edit update destroy ]

  def index
    @appmaps = Appmap.all
  end

  def show
    event = Event.new(@appmap.path)
    visualizer = Visualizer.new(event.events)

    @visualizer = {
      "app/controllers": visualizer.controllers.count,
      "app/helpers": visualizer.helpers.count,
      "app/models": visualizer.models.count,
    }
  end

  def new
    @appmap = Appmap.new
  end

  def edit
  end

  def create
    @appmap = Appmap.new(appmap_params)

    respond_to do |format|
      if @appmap.save
        format.html { redirect_to appmap_url(@appmap), notice: "Appmap successfully created." }
        format.json { render :show, status: :created, location: @appmap }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appmap.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appmap.update(appmap_params)
        format.html { redirect_to appmap_url(@appmap), notice: "Appmap successfully updated." }
        format.json { render :show, status: :ok, location: @appmap }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appmap.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appmap.destroy

    respond_to do |format|
      format.html { redirect_to appmaps_url, notice: "Appmap successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_appmap
    @appmap = Appmap.find(params[:id])
  end

  def appmap_params
    params.require(:appmap).permit(:path)
  end
end
