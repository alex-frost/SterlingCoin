feature "Sterling coin calculator", type: :feature do
  scenario "User enters valid amount in Stirling coins" do
    enter_amount_of_money

    see_minimum_sterling_coins_for_amount
  end

  def enter_amount_of_money
    visit "/"
    fill_in :amount, with: "£4.47"
    click_on 'Calculate'
  end

  def see_minimum_sterling_coins_for_amount
    page.should have_content '"£2" x 2, "20p" x 2, "5p" x 1, "2p" x 1'
  end
end
