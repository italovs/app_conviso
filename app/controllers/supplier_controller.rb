class SupplierController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
    if @supplier.blank?
      render status: :not_found
    else
      render json: @supplier, status: :ok
    end
  end

  def new; end

  def create
    supplier = Supplier.new(name: params[:name],
                            email: params[:email],
                            phone: params[:phone],
                            category: params[:category],
                            user_id: current_user.id)
    if supplier.save
      render json: supplier, status: :created
    else
      render json: "falha ao criar fornecedor: #{supplier.errors}", status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    if supplier.blank?
      render json: 'Fornecedor não encontrado', status: :not_found
    else
      supplier.destroy
      render json: 'Fornecedor deletado', status: :no_content
    end
  end

  def edit; end

  def update
    supplier = Supplier.find(params[:id])
    supplier.name = params[:name] if params[:name].present?
    supplier.email = params[:email] if params[:email].present?
    supplier.password = params[:password] if params[:password].present?
    supplier.category = params[:category] if params[:category].present?
    if supplier.user_id == current_user.id
      if supplier.save
        render json: supplier, status: :ok
      else
        render json: "falha ao atualizar fornecedor, #{supplier.errors}", status: :unprocessable_entity
      end
    else
      render json: 'esse fornecedor não pertecem a essa conta', status: :unauthorized
    end
  end
end
