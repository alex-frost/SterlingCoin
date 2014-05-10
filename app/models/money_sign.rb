class MoneySign
  def initialize(value)
    @value = value
  end

  def decimal_point?
    @decimal_point ||= @value.include?('.')
  end

  def pound_sign?
    @pound_sign ||= (@value[0] == "£")
  end

  def pence_sign?
    @pence_sign ||= (@value[-1] == "p")
  end

  def no_pound_and_no_decimal?
    !pound_sign? && !decimal_point?
   end

  def remove_pounds_and_pence_signs
    striped = if pound_sign?
                @value[1..-1]
              else
                @value
              end

    if pence_sign?
      striped[0..-2]
    else
      striped
    end
  end
end
