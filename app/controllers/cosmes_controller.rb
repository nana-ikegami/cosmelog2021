class CosmesController < ApplicationController
  before_action :cosme_find, only: [:show, :edit, :update, :destroy]
  before_action :search_personalcolor_cosme, only: [:index, :personalcolor]

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
    @comment = Comment.new
    @comments = @cosme.comments
  end

  def edit
  end

  def update
    if @cosme.update(cosme_params)
      redirect_to cosme_path(@cosme.id)
    else
      render :edit
    end
  end

  def destroy
    @cosme.destroy
    redirect_to root_path
  end

  def search
    @cosmes = Cosme.search(params[:keyword])
  end

  def personalcolor
    @cosmes = @q.result
    personalcolor_id = params[:q][:personalcolor_id_eq]
    @personalcolor = Personalcolor.find_by(id: personalcolor_id)
  end

  private

  def cosme_params
    params.require(:cosme).permit(:name, :image, :text, :title, :personalcolor_id).merge(user_id: current_user.id)
  end

  def cosme_find
    @cosme = Cosme.find(params[:id])
  end

  def search_personalcolor_cosme
    @q = Cosme.ransack(params[:q])
  end
end
