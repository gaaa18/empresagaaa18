class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def nuevo_cliente
    @cliente = Cliente.new
  end

  def crear_cliente
    @cliente = Cliente.new(cliente_params)
    @cliente.save
    redirect_to :controller => "clientes", :action => "index"
  end
  
  def editar_cliente
    @cliente = Cliente.find(params[:id])
  end
  
  def actualizar_cliente
    @cliente = Cliente.find(params[:id])
    @cliente.update_attributes(cliente_params)
    redirect_to :controller => "clientes", :action => "index"
  end
  
  def mostrar_cliente
    @cliente = Cliente.find(params[:id])
  end
  
  def borrar_cliente
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    redirect_to :controller => "clientes", :action => "index"
  end
    
    

  private
  def cliente_params
    allow = [:nombre,:apellido,:direccion,:telefono]
    params.require(:cliente).permit(allow)
  end
end
