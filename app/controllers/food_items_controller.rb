class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]

  # GET /food_items
  # GET /food_items.json
  def index
    # Sort
    if params[:sort] == "alphabetical"
      @sort_order = 0
      order = 'menu_type_id ASC, name'
    elsif params[:sort] == "price_asc"
      @sort_order = 1
      order = 'menu_type_id ASC, price ASC'
    elsif params[:sort] == "price_desc"
      @sort_order = 2
      order = 'menu_type_id ASC, price DESC'
    elsif params[:sort] == "most_viewed"
      @sort_order = 3
      order = 'coalesce(view_count, 0) DESC'
    else
      @sort_order = 0
      order = 'menu_type_id ASC, name'
    end

    menu_type_id = -1
    if params[:menu_type] == "all"
      @menu_type = "all"
    elsif params[:menu_type] == "breakfast"
      @menu_type = "breakfast"
      menu_type_id = 17
    elsif params[:menu_type] == "lunch"
      @menu_type = "lunch"
      menu_type_id = 18
    elsif params[:menu_type] == "dinner"
      @menu_type = "dinner"
      menu_type_id = 19
    elsif params[:menu_type] == "drinks"
      @menu_type = "drinks"
      menu_type_id = 20
    else
      @menu_type = "all"
    end

    if params[:search]
      @food_items = FoodItem.search(params[:search], menu_type_id).order(order)
    else
      #@food_items = FoodItem.all.order("menu_type_id ASC, created_at DESC")
      if (menu_type_id != -1)
        @food_items = FoodItem.where(menu_type_id: menu_type_id).order(order)
      else
        @food_items = FoodItem.all.order('coalesce(view_count, 0) DESC')
      end
    end

    @breakfast_items = @food_items.where(menu_type_id: 17).limit(5)
    @lunch_items = @food_items.where(menu_type_id: 18).limit(5)
    @dinner_items = @food_items.where(menu_type_id: 19).limit(5)
    @drinks_items = @food_items.where(menu_type_id: 20).limit(5)



    #@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  # GET /food_items/1
  # GET /food_items/1.json
  def show
    @food_item.increment!(:view_count)
  end

  # GET /food_items/new
  def new
    @food_item = FoodItem.new
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /food_items
  # POST /food_items.json
  def create
    @food_item = FoodItem.new(food_item_params)

    respond_to do |format|
      if @food_item.save
        format.html { redirect_to @food_item, notice: 'Food item was successfully created.' }
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1
  # PATCH/PUT /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to @food_item, notice: 'Food item was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1
  # DELETE /food_items/1.json
  def destroy
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_to food_items_url, notice: 'Food item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_item_params
      params.require(:food_item).permit(:name, :description, :price, :type, :view_count, :image_url)
    end
end
