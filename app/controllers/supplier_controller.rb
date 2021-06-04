class SupplierController < AdministrativeController
  def index
    @suppliers = Supplier.where(user_id: current_user.id)
  end

  def show
    @supplier = Supplier.find(params[:id])
    if @supplier.blank?
      render json: "fornecedor não encontrado",status: :not_found
    end
  end

  def new 
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.user_id = current_user.id
    if @supplier.save
      @suppliers = Supplier.where(user_id: current_user)
      redirect_to( root_path)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    if supplier.blank?
      render json: 'Fornecedor não encontrado', status: :not_found
      
    else
      supplier.destroy
      redirect_to(root_path, status: :no_content)
    end
  end

  def edit
    @supplier = Supplier.find(params[:id]);
  end

  def update
    supplier = Supplier.find(params[:id])
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.category = params[:category]
    supplier.phone = params[:phone]
    if supplier.user_id == current_user.id
      if supplier.save
        @suppliers = Supplier.where(user_id: current_user.id)
        render :index, status: :ok
      else
        render json: "falha ao atualizar fornecedor, #{supplier.errors}", status: :unprocessable_entity
      end
    else
      render json: 'esse fornecedor não pertecem a essa conta', status: :unauthorized
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :category, :email, :phone)
  end
end
