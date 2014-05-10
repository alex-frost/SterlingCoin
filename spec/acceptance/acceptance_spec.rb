feature "Sterling coin calculator", type: :feature do
  scenario "User enters valid amount in Stirling coins" do
    enter_amount_of_money

    see_minimum_sterling_coins_for_amount
  end

  def enter_amount_of_money
    fill_in :amount, with: "£4.47"
  end

  def see_minimum_sterling_coins_for_amount
    page.should have_content "2x £2, 2x 20p, 1x 5p, 1x 2p"
  end
end
