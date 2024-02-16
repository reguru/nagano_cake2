class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def update

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
