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

  def pounds
    @pounds ||= safe_convert_to_int(pounds_and_pence[0])
  end

  def pence
    @pence ||=  ((safe_convert_to_int ten_times_input_pence_padded) / 10.0).round
  end

  private

  def ten_times_input_pence_padded
    input_pence = pounds_and_pence[1]

    begin
      first, second, third = input_pence.split('')
    rescue
      "000" #case with no pence added after .
    else
      if first && second
        if third
          first + second + third
        else
          first + second + "0"
        end
      elsif first
        first + "00"
      end
    end
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

  def pounds_and_pence
    @pounds_and_pence ||= if !money_sign.pound_sign? && !after_decimal_point
                             [nil, before_decimal_point]
                           else
                             [before_decimal_point, after_decimal_point]
                           end
  end

  def before_decimal_point
    split_into_pounds_and_pence[0]
  end

  def after_decimal_point
    split_into_pounds_and_pence[1]
  end

  def split_into_pounds_and_pence
    remove_pounds_and_pence_signs.split(".")
  end

  def remove_pounds_and_pence_signs
    striped = (@input_amount[0] == "£") ? @input_amount[1..-1] : @input_amount
    (striped[-1] == "p") ? striped[0..-2] : striped
  end

  def money_sign
    @mony_sign ||= MoneySign.new(@input_amount)
  end

end
