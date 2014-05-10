class PenceOnly < PoundAndPence

  def pounds
    pence / 100
  end

  def pence
    safe_convert_to_int before_decimal_point
  end

end
