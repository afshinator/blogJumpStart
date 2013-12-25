require 'spec_helper'

describe "authors/show" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :username => "Username",
      :email => "Email",
      :uname => "Uname",
      :password => "",
      :password_confirmation => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Uname/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
