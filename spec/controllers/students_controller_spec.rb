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

  describe "POST 'create" do
    before(:each) do
      @house = FactoryGirl.create(:house)
    end

    context "when the attributes are valid" do
      TEST_STUDENT_NAME = "DEADBEEF"

      def post_valid_create
        post 'create', student: {name: TEST_STUDENT_NAME}
      end

      it "returns http success" do
        post_valid_create
        response.should redirect_to students_path
      end

      it "should create student" do
        expect {post_valid_create}.to change{Student.count}.from(0).to(1)
      end

      it "should create student with name provided" do
        post_valid_create
        student = Student.last
        student.name.should eq TEST_STUDENT_NAME
      end
    end

    context "when the attributes are invalid" do
      def post_invalid_create
        post 'create', student: {}
      end

      it "returns http success" do
        post_invalid_create
        response.should be_success
      end

      it "should not create student" do
        expect {post_invalid_create}.not_to change{Student.count}
      end
    end
  end

  describe "GET 'new" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "should assigns @student" do
      get 'new'
      assigns(:student).should_not be_nil
      assigns(:student).should be_new_record
    end
  end
end