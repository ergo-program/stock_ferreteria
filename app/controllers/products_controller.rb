class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    
    @brands = Brand.all
    @categories = Category.all

    @brand = Brand.new
    @category = Category.new
    
  end

  # GET /products/1/edit
  def edit
    product = Product.find(params[:id])
    @brands = Brand.all
    @categories = Category.all
    @brand = Brand.find(product.brand_id)
    @category = Category.find(product.category_id)
  end

  # POST /products
  # POST /products.json
  def create
    @brands = Brand.all
    @categories = Category.all
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'El producto fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'El producto fue editado exitosamente.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    respond_to do |format|
      if DMovement.find_by(product_id: @product.id).nil? 
        @product.destroy
        format.html { redirect_to products_url, notice: 'El producto fue eliminado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { redirect_to products_url, notice: 'No se puede eliminar, el producto esta siendo utilizado.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:codigo, :nombre, :descripcion, :unidad_medida, :costo, :precio_venta, :cantidad, :canitdad_min, :brand_id, :category_id)
    end
end
