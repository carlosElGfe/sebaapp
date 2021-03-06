class TraysController < ApplicationController
  before_action :set_tray, only: [:show, :edit, :update, :destroy]

  # GET /trays
  # GET /trays.json
  def index
    @trays = Tray.all
  end

  # GET /trays/1
  # GET /trays/1.json
  def show
  end
def add_item
  pe = Tray.new
  order_to_use = Order.where(id:cookies[:current_order_idd]).first
  pe.order = order_to_use
  te = Tree.where(id:params[:id]).first
  pe.tree = te
  pe.save!
  format.html { redirect_to root_path }
end
  # GET /trays/new
  def new
    @tray = Tray.new
  end

  # GET /trays/1/edit
  def edit
  end

  # POST /trays
  # POST /trays.json
  def create
    @tray = Tray.new(tray_params)

    respond_to do |format|
      if @tray.save
        format.html { redirect_to @tray, notice: 'Tray was successfully created.' }
        format.json { render :show, status: :created, location: @tray }
      else
        format.html { render :new }
        format.json { render json: @tray.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trays/1
  # PATCH/PUT /trays/1.json
  def update
    respond_to do |format|
      if @tray.update(tray_params)
        format.html { redirect_to @tray, notice: 'Tray was successfully updated.' }
        format.json { render :show, status: :ok, location: @tray }
      else
        format.html { render :edit }
        format.json { render json: @tray.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trays/1
  # DELETE /trays/1.json
  def destroy
    @tray.destroy
    respond_to do |format|
      format.html { redirect_to trays_url, notice: 'Tray was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tray
      @tray = Tray.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tray_params
      params.fetch(:tray, {})
    end
end
