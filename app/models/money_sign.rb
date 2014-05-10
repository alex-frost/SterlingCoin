class MoneySign
  def initialize(value)
    @value = value
  end

  def has_decimal_point?
    @has_decimal_point ||= @value.include?('.')
  end

  def has_pound_sign?
    @has_pound_sign ||= (@value[0] == "£")
  end

  def has_pence_sign?
    @has_pence_sign ||= (@value[-1] == "p")
  end

  def remove_pounds_and_pence_signs
    striped = if has_pound_sign?
                @value[1..-1]
              else
                @value
              end

    if has_pence_sign?
      striped[0..-2]
    else
      striped
    end
  end
end
