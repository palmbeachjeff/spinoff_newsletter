class SpinoffsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @spinoffs = Spinoff.all 
  end

end
