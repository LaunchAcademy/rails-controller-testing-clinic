require "rails_helper"

RSpec.describe Api::V1::TasksController, type: :controller do

  describe "GET#index" do
    let!(:task1) { FactoryBot.create(:task) }
    let!(:task2) { FactoryBot.create(:task) }
  
    it "return a successful status and content type of json" do
      get :index
      
      expect(response.status).to eq 200
      expect(response.content_type).to eq "application/json"
    end  
    
    it "should return all tasks from the database" do
      get :index

      returned_response = JSON.parse(response.body)
      # binding.pry
      expect(returned_response.length).to eq 2

      expect(returned_response[0]["name"]).to eq task1.name
      expect(returned_response[0]["description"]).to eq task1.description
    
      expect(returned_response[1]["name"]).to eq task2.name
      expect(returned_response[1]["description"]).to eq task2.description
    end
  end

  describe "POST#create" do
    context "when a request correct params is made" do
      let!(:new_task_data) { { task: { name: "be hella fly", description: "lol, one doesn't just CHOOSE to be hella fly" } } }
      
      it "add the task to the database" do
        previous_count = Task.count
        # binding.pry
        post :create, params: new_task_data
        
        new_count = Task.count
        # binding.pry
        expect(new_count).to eq previous_count + 1
      end
      
      it "returns the new task object as json" do
        post :create, params: new_task_data
        # binding.pry
        returned_response = JSON.parse(response.body)
        
        expect(returned_response["task"]["name"]).to eq "be hella fly"
        expect(returned_response["task"]["description"]).to eq "lol, one doesn't just CHOOSE to be hella fly"
      end
    end

    context "when a malformed request is made" do
      let!(:bad_task_data) { { task: { description: "woops I forget the task name" } } }
     
      it "should not save to the database" do
        previous_count = Task.count
       
        post :create, params: bad_task_data
        # binding.pry
        new_count = Task.count
        
        expect(previous_count).to eq new_count
      end
      
      it "should return an error message" do
        post :create, params: bad_task_data
        
        returned_response = JSON.parse(response.body)
        # binding.pry
        expect(returned_response["errors"][0]).to eq "Name can't be blank"
      end
    end
  end
end