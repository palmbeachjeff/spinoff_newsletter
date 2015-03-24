class SpinoffsController < ApplicationController
  before_filter :authenticate_user!



  def index
    @spinoffs = Spinoff.paginate(per_page: 25, page: params[:page]) 
  end

  def show
    @spinoff = Spinoff.find(params[:id])
    @data_history_p = YahooFinance.historical_quotes(@spinoff.parent_ticker, { start_date: Time::now - (60*60*24*2770), end_date: Time::now })
    @data_history_s = YahooFinance.historical_quotes(@spinoff.spinoff_ticker, { start_date: Time::now - (60*60*24*2770), end_date: Time::now })
    @data = YahooFinance.quotes([@spinoff.parent_ticker, @spinoff.spinoff_ticker], [ :after_hours_change_real_time,
                                                                                     :annualized_gain, 
                                                                                     :ask,
                                                                                     :ask_real_time,
                                                                                     :ask_size,
                                                                                     :average_daily_volume,
                                                                                     :bid,
                                                                                     :bid_real_time,
                                                                                     :bid_size,
                                                                                     :book_value,
                                                                                     :change,
                                                                                     :change_and_percent_change,
                                                                                     :change_from_200_day_moving_average, 
                                                                                     :change_from_50_day_moving_average, 
                                                                                     :change_from_52_week_high, 
                                                                                     :change_From_52_week_low, 
                                                                                     :change_in_percent, 
                                                                                     :change_percent_realtime, 
                                                                                     :change_real_time,
                                                                                     :close, 
                                                                                     :comission,
                                                                                     :day_value_change, 
                                                                                     :day_value_change_realtime, 
                                                                                     :days_range,
                                                                                     :days_range_realtime, 
                                                                                     :dividend_pay_date, 
                                                                                     :dividend_per_share,
                                                                                     :dividend_yield,
                                                                                     :earnings_per_share,
                                                                                     :ebitda, 
                                                                                     :eps_estimate_current_year, 
                                                                                     :eps_estimate_next_quarter, 
                                                                                     :eps_estimate_next_year, 
                                                                                     :error_indicator, 
                                                                                     :ex_dividend_date,
                                                                                     :float_shares, 
                                                                                     :high, 
                                                                                     :high_52_weeks, 
                                                                                     :high_limit, 
                                                                                     :holdings_gain, 
                                                                                     :holdings_gain_percent, 
                                                                                     :holdings_gain_percent_realtime, 
                                                                                     :holdings_gain_realtime, 
                                                                                     :holdings_value, 
                                                                                     :holdings_value_realtime, 
                                                                                     :last_trade_date,
                                                                                     :last_trade_price,
                                                                                     :last_trade_realtime_withtime, 
                                                                                     :last_trade_size, 
                                                                                     :last_trade_time, 
                                                                                     :last_trade_with_time, 
                                                                                     :low, 
                                                                                     :low_52_weeks, 
                                                                                     :low_limit, 
                                                                                     :market_cap_realtime, 
                                                                                     :market_capitalization, 
                                                                                     :more_info, 
                                                                                     :moving_average_200_day, 
                                                                                     :moving_average_50_day, 
                                                                                     :name, 
                                                                                     :notes, 
                                                                                     :one_year_target_price, 
                                                                                     :open, 
                                                                                     :order_book, 
                                                                                     :pe_ratio, 
                                                                                     :pe_ratio_realtime, 
                                                                                     :peg_ratio, 
                                                                                     :percent_change_from_200_day_moving_average, 
                                                                                     :percent_change_from_50_day_moving_average, 
                                                                                     :percent_change_from_52_week_high, 
                                                                                     :percent_change_from_52_week_low, 
                                                                                     :previous_close, 
                                                                                     :price_eps_estimate_current_year, 
                                                                                     :price_eps_Estimate_next_year, 
                                                                                     :price_paid, 
                                                                                     :price_per_book, 
                                                                                     :price_per_sales, 
                                                                                     :shares_owned, 
                                                                                     :short_ratio, 
                                                                                     :stock_exchange, 
                                                                                     :symbol, 
                                                                                     :ticker_trend, 
                                                                                     :trade_date,
                                                                                     :trade_links, 
                                                                                     :volume,
                                                                                     :weeks_range_52 ], { raw: false } )
  end

  def admin
  end
end


