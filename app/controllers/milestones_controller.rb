class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @milestone = Milestone.new(project: @project)
  end

  def create 
    set_mileston

    @milestone.update(milestone_params)
    @milestone.user = current_user
    @milestone.project = Project.find(params[:project_id])
    @milestone.product_breakdown_structure_ids = params[:product_breakdown_structure_ids]

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to project_milestones_path(@milestone.project.id), notice: 'Milestone was successfully created.' }
        format.json { render action: 'show', status: :created, location: @milestone }
      else
        format.html { render action: 'new' }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mileston
      @milestone = Milestone.where('id = ?', params[:id]).first
      if @milestone.nil?
        @milestone = Milestone.new(project: @project) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_params
      params.require(:milestone).permit(:name, :description, :user_id, :start_date, :end_date, :project_id, :product_breakdown_structure_ids)
    end
end