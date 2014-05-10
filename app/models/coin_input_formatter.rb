class CoinInputFormatter
  delegate :pounds, :pence, to: :pounds_and_pence

  def initialize(input_amount)
    @input_amount = input_amount
  end

  def valid?
    if pounds && pence
      true
    else
      false
    end
  end


  private

  def pounds_and_pence
    @pounds_and_pence ||= if money_sign.no_pound_and_no_decimal?
                            PenceOnly.new(money_sign.remove_pounds_and_pence_signs)
                          else
                            PoundAndPence.new(money_sign.remove_pounds_and_pence_signs)
                          end
  end

  def money_sign
    @mony_sign ||= MoneySign.new(@input_amount)
  end

end
