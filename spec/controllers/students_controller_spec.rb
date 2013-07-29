require 'spec_helper'

describe StudentsController do
  describe "GET 'index" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    context "when there is no student created" do
      it "should assigns empty array to @students" do
        get 'index'
        assigns(:students).should eq []
      end
    end

    context "when there is one student created" do
      before(:each) do
        @student = FactoryGirl.create(:student)
      end

      it "should assigns @students" do
        get 'index'
        assigns(:students).should eq [@student]
      end
    end
  end

  describe "GET 'show" do
    before(:each) do
      @student = FactoryGirl.create(:student)
    end

    it "returns http success" do
      get 'show', id: @student.to_param
      response.should be_success
    end

    it "should assigns @student" do
      get 'show', id: @student.to_param
      assigns(:student).should eq @student
    end
  end
end