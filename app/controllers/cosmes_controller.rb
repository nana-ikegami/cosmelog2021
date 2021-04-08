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
    @comment = Comment.new
    @comments = @cosme.comments
  end

  def edit
    @cosme = Cosme.find(params[:id])
  end

  def update
    @cosme = Cosme.find(params[:id])
    
    if @cosme.update(cosme_params)
      redirect_to cosme_path(@cosme.id)
    else
      render :edit
    end
  end

  def destroy
    @cosme = Cosme.find(params[:id])
    @cosme.destroy
    redirect_to root_path
  end

  private
  def cosme_params
    params.require(:cosme).permit(:name, :image, :text, :title).merge(user_id: current_user.id)
  end
end
