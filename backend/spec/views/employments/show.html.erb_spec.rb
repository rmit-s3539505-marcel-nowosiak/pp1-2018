require 'rails_helper'

RSpec.describe "employments/show", type: :view do
  before(:each) do
    @employment = assign(:employment, Employment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
