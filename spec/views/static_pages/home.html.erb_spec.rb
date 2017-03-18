require 'rails_helper'

RSpec.describe "static_pages/home", :type => :view do
  it "renders the home page" do
    render
    expect(rendered).to have_content('Rpgazebo')
  end
end
