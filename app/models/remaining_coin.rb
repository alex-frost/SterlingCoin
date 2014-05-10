class RemainingCoin
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def num_in_denomination(demomination)
    num_and_remainder = value.divmod(demomination)
    @value = num_and_remainder[1]
    num_and_remainder[0]
  end

end

