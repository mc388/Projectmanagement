class WorkBreakdownStructuresController < ApplicationController
  before_action :set_work_breakdown_structure, only: [:show, :edit, :update, :destroy]

  def save_structure
    wbs = ActiveSupport::JSON.decode(params[:wbs])

    wbs.each do |item| 
      curr = WorkBreakdownStructure.find(item["id"].to_i)
      curr.parent = item["parent"].to_i
      curr.level = item["level"].to_i
      curr.save
    end

    respond_to do |format|
      format.json { render :json => "OK" }
    end
  end
  
  def index
    @project = Project.find(params[:project_id])
    @work_breakdown_structure = WorkBreakdownStructure.new(project: @project)
    @work_package = WorkPackage.new(project: @project)
  end

  def show
    respond_to do |format|
      format.json { render json: @work_breakdown_structure.to_json(:include => :work_packages) }
    end
  end

  def create 
    @work_breakdown_structure = WorkBreakdownStructure.new(work_breakdown_structure_params)
    @work_breakdown_structure.user = current_user
    @work_breakdown_structure.project_id = params[:project_id]
    @work_breakdown_structure.parent = params[:parent]
    @work_breakdown_structure.level = WorkBreakdownStructure.find(@work_breakdown_structure.parent).level + 1

    respond_to do |format|
      if @work_breakdown_structure.save
        format.html { redirect_to project_work_breakdown_structures_path, notice: 'WBS was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_breakdown_structure }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_breakdown_structure.project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    childs = find_childs(@work_breakdown_structure.id)
    childs.each do |c|
      c.work_packages.each do |wp|
        wp.destroy
      end
      c.destroy
    end
    @work_breakdown_structure.work_packages.each do |wp|
      wp.destroy
    end
    @work_breakdown_structure.destroy
    respond_to do |format|
      format.html { redirect_to project_work_breakdown_structures_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_breakdown_structure
      @work_breakdown_structure = WorkBreakdownStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_breakdown_structure_params
      params.require(:work_breakdown_structure).permit(:name, :parent, :user_id, :order, :level, :project_id)
    end

    # find all the childs to avoid dead entries
    def find_childs(parent)
      ret = []
      el = WorkBreakdownStructure.where('parent = ?', parent)
      el.each do |e|
        ret << e
        ret += find_childs(e.id) 
      end
      ret
    end
end
