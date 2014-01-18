class ResourceBreakdownStructuresController < ApplicationController
  before_action :set_resource_breakdown_structure, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @resource_breakdown_structure = ResourceBreakdownStructure.new(project: @project)
    @resource = Resource.new(project: @project)
    @qualification = Qualification.new(project: @project)
  end

  def show
    respond_to do |format|
      format.json { render json: @resource_breakdown_structure.to_json(:include => :resources) }
    end
  end

  def create 
    @resource_breakdown_structure = ResourceBreakdownStructure.new(resource_breakdown_structure_params)
    @resource_breakdown_structure.user = current_user
    @resource_breakdown_structure.project_id = params[:project_id]
    @resource_breakdown_structure.parent = params[:parent]
    @resource_breakdown_structure.level = WorkBreakdownStructure.find(@resource_breakdown_structure.parent).level + 1

    respond_to do |format|
      if @resource_breakdown_structure.save
        format.html { redirect_to project_resource_breakdown_structures_path, notice: 'RBS was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource_breakdown_structure }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource_breakdown_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource_breakdown_structure.resources.each do |r|
      r.destroy
    end
    @resource_breakdown_structure.destroy
    respond_to do |format|
      format.html { redirect_to project_resource_breakdown_structures_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_breakdown_structure
      @resource_breakdown_structure = ResourceBreakdownStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_breakdown_structure_params
      params.require(:resource_breakdown_structure).permit(:name, :resource_type, :role, :count, :qualification_id, :amount, :parent, :level, :project_id)
    end
end
