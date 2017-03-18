require 'rails_helper'

RSpec.describe "static_pages/about", :type => :view do
  it "renders the about page" do
    render
    expect(rendered).to have_content('About')
  end
end
