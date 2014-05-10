class CoinCalculator
  def initialize(input_amount)
    @input_amount = input_amount
  end

  def split_into_pounds_and_pence
    remove_pounds_and_pence_signs.split(".")
  end

  def remove_pounds_and_pence_signs
    striped = (@input_amount[0] == "£") ? @input_amount[1..-1] : @input_amount
    (striped[-1] == "p") ? striped[0..-2] : striped
  end

end
