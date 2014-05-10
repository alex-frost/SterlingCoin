class CoinCalculatorController < ApplicationController
  def new

  end

  def create
    CoinCalculator.new(coin_calculator_params)
  end

  private

  def coin_calculator_params
    params[:amount]
  end
end
