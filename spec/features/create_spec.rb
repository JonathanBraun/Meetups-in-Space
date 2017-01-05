require 'spec_helper'

feature "Create Meetups page" do

let! (:meetup) { Meetup.create(time: '1pm', duration: '1 hour', name: 'Eammonn\'s birthday party', location: 'A dumpster', date: 'June 19th', description: 'Board games and booze') }

  scenario "it shows all meetups" do
    visit '/meetups/create'

    expect(page).to have_content "Eammonn's birthday party"
  end


end
