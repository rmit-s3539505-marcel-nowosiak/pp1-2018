require 'rails_helper'

RSpec.describe "employments/new", type: :view do
  before(:each) do
    assign(:employment, Employment.new())
  end

  it "renders new employment form" do
    render

    assert_select "form[action=?][method=?]", employments_path, "post" do
    end
  end
end
