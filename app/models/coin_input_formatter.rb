class CoinInputFormatter
  attr_reader :pounds, :pence

  def initialize(input_amount)
    @input_amount = input_amount
    split_into_pounds_and_pence
  end


  def split_into_pounds_and_pence
    pounds_and_pence = remove_pounds_and_pence_signs.split(".")
    @pounds = Integer pounds_and_pence[0]
    @pence = Integer pounds_and_pence[1]
    pounds_and_pence
  end

  private

  def remove_pounds_and_pence_signs
    striped = (@input_amount[0] == "£") ? @input_amount[1..-1] : @input_amount
    (striped[-1] == "p") ? striped[0..-2] : striped
  end

end
