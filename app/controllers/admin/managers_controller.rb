class Admin::ManagersController < AdminController
  before_action :set_admin_manager, only: [:show, :edit, :update, :destroy]

  # GET /admin/managers
  # GET /admin/managers.json
  def index
    @admin_managers = ::Manager.all
  end

  # GET /admin/managers/1
  # GET /admin/managers/1.json
  def show
  end

  # GET /admin/managers/new
  def new
    @admin_manager = ::Manager.new
  end

  # GET /admin/managers/1/edit
  def edit
  end

  # POST /admin/managers
  # POST /admin/managers.json
  def create
    @admin_manager = ::Manager.new(admin_manager_params)

    respond_to do |format|
      if @admin_manager.save
        format.html { redirect_to @admin_manager, notice: 'Manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_manager }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/managers/1
  # PATCH/PUT /admin/managers/1.json
  def update
    respond_to do |format|
      if @admin_manager.update(admin_manager_params)
        format.html { redirect_to @admin_manager, notice: 'Manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/managers/1
  # DELETE /admin/managers/1.json
  def destroy
    @admin_manager.destroy
    respond_to do |format|
      format.html { redirect_to admin_managers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_manager
      @admin_manager = ::Manager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_manager_params
      params[:admin_manager]
    end
end
