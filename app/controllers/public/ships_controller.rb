class Public::ShipsController < ApplicationController

  def index
    @ship = Ship.new
    @ships = Ship.all
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.customer_id = current_customer.id
    @ship.save
    redirect_to '/public/ships'
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    ship = Ship.find(params[:id])
    ship.update(ship_params)
    redirect_to public_ships_path
  end

  def destroy
    ship = Ship.find(params[:id])
    ship.destroy
    redirect_to '/public/ships'
  end

  protected

  def ship_params
    params.require(:ship).permit(:post_code,:address,:name)
  end

end
