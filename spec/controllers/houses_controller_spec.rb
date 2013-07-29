require 'spec_helper'

describe HousesController do
  describe "GET 'index" do
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

  describe "GET 'show" do
    before(:each) do
      @house = FactoryGirl.create(:house)
    end

    it "returns http success" do
      get 'show', id: @house.to_param
      response.should be_success
    end

    it "should assigns @house" do
      get 'show', id: @house.to_param
      assigns(:house).should eq @house
    end

    context "when there is no students assigned to the house" do
      it "should assigns empty array to @students" do
        get 'show', id: @house.to_param
        assigns(:students).should eq []
      end
    end

    context "when there is a student assigned to the house" do
      before(:each) do
        @student = FactoryGirl.create(:student, house: @house)
      end

      it "should assigns @students" do
        get 'show', id: @house.to_param
        assigns(:students).should eq [@student]
      end
    end

    context "when there is a student assigned to another house" do
      before(:each) do
        @another_house = FactoryGirl.create(:house)
        @student = FactoryGirl.create(:student, house: @another_house)
      end

      it "should assigns empty array to @students" do
        get 'show', id: @house.to_param
        assigns(:students).should eq []
      end
    end
  end
end