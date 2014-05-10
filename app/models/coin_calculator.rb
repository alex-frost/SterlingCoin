class CoinCalculator
  def initialize(input_amount)
    @coin_input_formatter = CoinInputFormatter.new(input_amount)
  end

end
