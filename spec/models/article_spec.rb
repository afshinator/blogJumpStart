require 'spec_helper'

describe Article do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  # p.367
  it "is valid with valid attributes" do
    Article.new.should be_valid
  end
end
