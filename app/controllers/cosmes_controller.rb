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

  private
  def tweet_params
    params.require(:cosme).permit(:name, :image, :text, :title).merge(user_id: current_user.id)
  end
end
