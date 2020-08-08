class RoadsController < ApplicationController
  before_action :set_road, only: [:update]

  # GET /roads
  # GET /roads.json
  def index
    @roads = Road.all
  end

  # GET /roads/1
  # GET /roads/1.json
  def show
  end

  # GET /roads/new
  def new
    @road = Road.new
  end
  def add_item
    pe = Road.new
    order_to_use = Order.where(id:cookies[:current_order_idd]).first
    pe.order = order_to_use
    te = Tree.where(id:params[:coc_id]).first
    pe.tree = te
    pe.save!
    respond_to do |format|
    format.html { redirect_to root_path }
    end
  end
  def add_item_last
    pe = Road.new
    order_to_use = Order.where(id:cookies[:current_order_idd]).first
    pe.order = order_to_use
    te = Tree.where(id:params[:coc_id]).first
    pe.tree = te
    pe.save!
    respond_to do |format|
    format.html { redirect_to pay_path(Order.where(id:cookies[:current_order_idd]).first.id) }
    end
  end
  def eliminate_item
    idd = params[:i_id]
    Road.where(id:idd).first.delete
    respond_to do |format|
        format.html { redirect_to pay_path(Order.where(id:cookies[:current_order_idd]).first.id)}
    end
    
  end
  # GET /roads/1/edit
  def edit
  end

  # POST /roads
  # POST /roads.json
  def create
    @road = Road.new(road_params)

    respond_to do |format|
      if @road.save
        format.html { redirect_to @road, notice: 'Road was successfully created.' }
        format.json { render :show, status: :created, location: @road }
      else
        format.html { render :new }
        format.json { render json: @road.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roads/1
  # PATCH/PUT /roads/1.json
  def update
    respond_to do |format|
      if @road.update(road_params)
        format.html { redirect_to @road, notice: 'Road was successfully updated.' }
        format.json { render :show, status: :ok, location: @road }
      else
        format.html { render :edit }
        format.json { render json: @road.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roads/1
  # DELETE /roads/1.json
  def destroy
    @road.destroy
    respond_to do |format|
      format.html { redirect_to customer_orders_path(cookies[:customer_idd],cookies[:current_order_idd]) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_road
      @road = Road.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def road_params
      params.fetch(:road, {})
    end
end
