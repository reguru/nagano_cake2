class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item)
  end

  def update

  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:genre_id,:price,:is_active)
  end

end
