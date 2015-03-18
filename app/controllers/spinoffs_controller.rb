class SpinoffsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @spinoffs = Spinoff.paginate(per_page: 25, page: params[:page]) 
  end

  def show
    @spinoff = Spinoff.find(params[:id])
  end
end

