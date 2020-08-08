class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  # GET /orders
  # GET /orders.json
  def index
    @order = Order.where(id:cookies[:current_order_idd]).first
    @order_id = @order.id
    @trays = Road.where(order_id:cookies[:current_order_idd])
    @total = 0
    @trays.each do |tray|
      begin
        @total += tray.tree.price.split('$')[1].to_i
      rescue => exception
        total += 1
      end
    end
  end
def disp
  ig = params[:id]
  o = Order.where(id:ig).first
  o.disp = true
  e = Order.new
  e.customer_id = o.customer_id
  e.finished = o.finished
  e.personal = o.personal
  e.disp = o.disp
  e.finished = false
  e.almost = false
  e.copy = true
  e.total = o.roads.count
  e.ident = o.id
  e.content= o.content
  e.save!
  o.disp = true
  o.almost = false
  o.finished = false
  o.save!
  respond_to do |format|
    format.html { redirect_to search_path}
  end
end
def elim
  if current_user.admin
    t = Order.where(id:params[:id]).first
    t.disp = false
    t.almost = false
    t.finished = false
    t.ident = 0
    t.save!
    respond_to do |format|
      format.html { redirect_to search_path}
    end
  end
end
def pending
end
def elim2
  if current_user.admin
    t = Order.where(id:params[:id]).first
    t.disp = false
    t.almost = false
    t.finished = false
    t.copy = false
    t.save!
    t.roads.each do |e|
      e.destroy!
    end
    t.destroy!
    respond_to do |format|
      format.html { redirect_to search_path}
    end
  end
end
def wait
  o = Order.where(id:cookies[:current_order_idd]).first
  e = Order.new
  cont = ""
  o.roads.each do |tray|
    cont += tray.tree.id.to_s
    cont += ";"
  end
  e.customer_id = o.customer_id
  e.finished = o.finished
  e.personal = o.personal
  e.disp = o.disp
  e.finished = false
  e.almost = true
  e.copy = false
  e.content = cont
  e.total = o.roads.count
  e.ident = o.id
  e.save!
  o.save!
  @user = Customer.where(id:cookies[:customer_idd]).first
  UserMailer.with(user: @user).welcome_email.deliver_now
end
def admin
end
def pannel
  @venta_id_1 = 0
  @venta_id_2 = 0
  @venta_id_3 = 0
  @venta_id_4 = 0
  @venta_id_5 = 0
  @venta_id_6 = 0
  Order.where(copy:true).each do |order|
    begin
     order.content.split(";").each do |idod|
      idd=idod.to_s
      if idd=="1"
        @venta_id_1 +=1
      end
      if idd=="2"
        @venta_id_2 +=1
      end
      if idd=="3"
        @venta_id_3 +=1
      end
      if idd=="4"
        @venta_id_4 +=1
      end
      if idd=="5"
        @venta_id_5 +=1
      end
      if idd=="6"
        @venta_id_6 +=1
      end
     end
    rescue => exception
    
    end
  end
  @items_saled = 0
  Order.where(copy:true).each do |order|
    begin
      order.content.split(";").each do |element|
        @items_saled += 1
      end
      @items_saled += -1
    rescue => exception
    end
  end
end
def ready
  if current_user.admin
    ig = params[:id]
    o = Order.where(id:ig).first
    o.finished = true
    o.almost = true
    o.disp = false
    o.save!
    respond_to do |format|
      format.html { redirect_to search_path}
    end
  end
end
def pay
  @comunas = []
  @comunas.push("Vitacura")
  @comunas.push("Las Condes")
  @comunas.push("Lo Barnechea")
  @comunas.push("Providencia")
  @order = Order.where(id:cookies[:current_order_idd]).first
  @order_id = @order.id
  @trays = Road.where(order_id:cookies[:current_order_idd])
  @total = 0
  @trees_ids = []
  @trays.each do |tray|
    @trees_ids.push(tray.tree.id)
    begin
      @total += tray.tree.price.split('$')[1].to_i
    rescue => exception
      total += 1
    end
  end
  @trees_ids = @trees_ids.uniq
end
  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def add_item

  end
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.fetch(:order, {}).permit(:finished, :discount,:customer_id)
    end
end

