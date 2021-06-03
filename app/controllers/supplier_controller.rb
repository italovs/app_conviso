class SupplierController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def create
    supplier = Supplier.new(name: params[:name],
                            email: params[:email],
                            phone: params[:phone],
                            type: params[:type])
    if supplier.save
      render json: supplier, status: :created
    else
      render json: "falha ao criar fornecedor: #{supplier.errors}",
             status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find(params[:id])
    if supplier.blank?
      render json: 'Fornecedor não encontrado', status: :not_found
    else
      supplier.destroy
      render status: :no_content
    end
  end

  def updated
    supplier = Supplier.find(params[:id])
    supplier.name = params[:name]
    supplier.email = params[:email]
    supplier.password = params[:password]
    if supplier.save
      render json: supplier, status: :ok
    else
      render json: 'falha ao atualizar fornecedor', status: :unprocessable_entity
    end
  end
end
