class CoinInputFormatter

  def initialize(input_amount)
    @input_amount = input_amount
  end

  def valid?
    if @pound && @pence && !@invalid
      true
    else
      false
    end
  end

  private

  def pounds
    @pounds ||= safe_convert_to_int(split_into_pounds_and_pence[0])
  end

  def pence
    @pence ||= safe_convert_to_int(split_into_pounds_and_pence[1])
  end

  def safe_convert_to_int(string_value)
    if string_value
      begin
        Integer string_value
      rescue ArgumentError
        @invalid = true
        nil
      end
    end
  end

  def split_into_pounds_and_pence
    remove_pounds_and_pence_signs.split(".")
  end

  def remove_pounds_and_pence_signs
    striped = (@input_amount[0] == "£") ? @input_amount[1..-1] : @input_amount
    (striped[-1] == "p") ? striped[0..-2] : striped
  end

end
