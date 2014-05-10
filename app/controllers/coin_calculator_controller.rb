class CoinCalculatorController < ApplicationController
  def new

  end

  def create
    coin_calculator = CoinCalculator.new(coin_calculator_params)

    if coin_calculator.valid?
      flash[:sucess] = "You entered: #{coin_calculator_params}, in Stirling coins this is: " +
        coin_calculator.amount_in_sterling.to_s.gsub('=>', ' x ')
    else
      flash[:error] = "Number Format Not Recognised"
    end

    redirect_to new_coin_calculator_path
  end

  private

  def coin_calculator_params
    params[:amount]
  end
end
