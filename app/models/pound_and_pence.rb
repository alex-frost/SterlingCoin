class PoundAndPence
  def initialize(value)
    @value = value
  end

  def pounds
    @pounds ||= safe_convert_to_int before_decimal_point
  end

  def pence
    @pence ||= if after_decimal_point && !@invalid
                 ((safe_convert_to_int ten_times_input_pence_padded) / 10.0).round
               else
                 0
               end
  end

  private

  def ten_times_input_pence_padded
    input_pence = after_decimal_point

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

  def before_decimal_point
    split_at_decimal_point[0]
  end

  def after_decimal_point
    split_at_decimal_point[1]
  end

  def split_at_decimal_point
    @value.split('.')
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

end
