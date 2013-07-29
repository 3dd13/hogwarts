require 'spec_helper'

describe HousesController do
  it "returns http success" do
    get 'index'
    response.should be_success
  end

  context "when there is no house created" do
    it "should assigns empty array to @houses" do
      get 'index'
      assigns(:houses).should eq []
    end
  end

  context "when there is one house created" do
    before(:each) do
      @house = FactoryGirl.create(:house)
    end

    it "should assigns @houses" do
      get 'index'
      assigns(:houses).should eq [@house]
    end
  end
end