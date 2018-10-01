require 'rails_helper'

RSpec.describe "employments/edit", type: :view do
  before(:each) do
    @employment = assign(:employment, Employment.create!())
  end

  it "renders the edit employment form" do
    render

    assert_select "form[action=?][method=?]", employment_path(@employment), "post" do
    end
  end
end
