class PaintingsController < ApplicationController
  def new
    @painting = Painting.new
    @painting.artist = @artist
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @painting = Painting.new(painting_params)
    @painting.artist = @artist

    if @painting.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    redirect_to paintings_url, notice: 'Artist was successfully destroyed.'
  end

  private

  def painting_params
    params.require(:painting).permit(:name, :description, :artist_id)
  end
end
