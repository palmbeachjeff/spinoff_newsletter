class SpinoffsController < ApplicationController

  def index
    @spinoffs = Spinoff.paginate(per_page: 25, page: params[:page]) 
  end

end
