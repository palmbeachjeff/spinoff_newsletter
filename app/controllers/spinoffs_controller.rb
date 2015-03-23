class SpinoffsController < ApplicationController
  before_filter :authenticate_user!



  def index
    @spinoffs = Spinoff.paginate(per_page: 25, page: params[:page]) 
  end

  def show
    @spinoff = Spinoff.find(params[:id])
    @data = YahooFinance.quotes([@spinoff.parent_ticker, @spinoff.spinoff_ticker], [:change, :change_and_percent_change, :change_in_percent, :close, :last_trade_price, :last_trade_time, :name, :symbol, :trade_date, :ask, :bid, :last_trade_date], { raw: false } )
  end
  
  def admin
  
  end
  


end


