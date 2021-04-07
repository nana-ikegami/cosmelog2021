class CosmesController < ApplicationController
  def index
    @cosmes = Cosme.all
  end

  def new
    @cosme = Cosme.new
  end

  def create
    @cosme = Cosme.new(cosme_params)
    if @cosme.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @cosme = Cosme.find(params[:id])
  end

  def edit
    @cosme = Cosme.find(params[:id])
  end

  def update
  end

  private
  def cosme_params
    params.require(:cosme).permit(:name, :image, :text, :title).merge(user_id: current_user.id)
  end
end
