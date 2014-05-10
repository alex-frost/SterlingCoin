class CoinCalculator
  delegate :pounds, :pence, :valid?, to: :coins

  def initialize(input_amount)
    @input_amount = input_amount
  end

  def amount_in_sterling
    if valid?
      in_each_denomination({value: pounds, demomination: pound_coins, sign: "£"}).
        merge(in_each_denomination({value: pence, demomination: pence_coins, sign: "p"}))
    else
      {}
    end
  end

  private

  def in_each_denomination(pound_or_pence)
    remaining_coin = RemainingCoin.new(pound_or_pence[:value])

    in_each_denomination = {}

    pound_or_pence[:demomination].each do |d|
      num_in_denomination = remaining_coin.num_in_denomination(d)
      if num_in_denomination > 0
        in_each_denomination[denomination_string(pound_or_pence[:sign],d)] = num_in_denomination
      end
    end
    in_each_denomination
  end

  def denomination_string(sign, demomination)
    if sign == "p"
      "#{demomination}#{sign}"
    else
      "#{sign}#{demomination}"
    end
  end

  def coins
    @coins ||= CoinInputFormatter.new(@input_amount)
  end

  def pound_coins
    @pound_coins ||= [2,1]
  end

  def pence_coins
    @pence_coins ||= [50,20,10,5,2,1]
  end

end
