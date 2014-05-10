class PenceOnly < PoundAndPence

  def pounds
    pounds_and_pence[0]
  end

  def pence
    pounds_and_pence[1]
  end

  private

  def pounds_and_pence
    pence_only_input = (safe_convert_to_int before_decimal_point)
    if pence_only_input
      pence_only_input.divmod 100
    else
      [nil, nil]
    end
  end

end
