class CosmesController < ApplicationController
  def index
    @cosmes = Cosme.all
  end

  def new
    @cosme = Cosme.new
  end

  def create
  end
end
