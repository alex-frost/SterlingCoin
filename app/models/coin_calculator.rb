class CoinCalculator
  delegate :pounds, :pence, :valid?, to: :coins

  def initialize(input_amount)
    @input_amount = input_amount
  end

  def amount_in_sterling
    if valid?
      convert(pounds, pound_coins).merge(convert(pence, pence_coins))
    else
      {}
    end
  end

  private

  def convert(pound_or_pence, denomination)
    remaining_coin = pound_or_pence

    output = {}
    denomination.each do |d|
      num_in_denomination, remaining_coin = remaining_coin.divmod(d)
      output[d] = num_in_denomination
    end
    output
  end

  def coins
    @coins ||= CoinInputFormatter.new(@input_amount)
  end

  def pound_coins
    @pound_coins ||= [2,1]
  end

  def pence_coins
    @pence_coins ||= [50,20,10,5,2,1]
  end

end
