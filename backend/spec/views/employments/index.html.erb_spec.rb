require 'rails_helper'

RSpec.describe "employments/index", type: :view do
  before(:each) do
    assign(:employments, [
      Employment.create!(),
      Employment.create!()
    ])
  end

  it "renders a list of employments" do
    render
  end
end
