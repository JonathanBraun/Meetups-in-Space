require 'spec_helper'

feature "Meetups Details page" do

let! (:meetup) { Meetup.create(time: '1pm', duration: '1 hour', name: 'Eammonn\'s birthday party', location: 'A dumpster', date: 'June 19th', description: 'Board games and booze') }

  scenario "it shows all the info for a meetup" do
    visit '/meetups/' + meetup.id.to_s

    expect(page).to have_content "A dumpster"
    expect(page).to have_content "1 hour"
    expect(page).to have_content "1pm"
    expect(page).to have_content "June 19th"
    expect(page).to have_content "Board games and booze"
  end

end
