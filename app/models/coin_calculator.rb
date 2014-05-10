class CoinCalculator
  def initialize(input_amount)
    @input_amount = input_amount
  end

  def amount_in_sterling
    if coins.valid?
      {}
    else
      {}
    end
  end

  private

  def coins
    @coins ||= CoinInputFormatter.new(@input_amount)
  end
end
