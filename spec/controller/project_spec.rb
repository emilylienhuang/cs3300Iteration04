require 'rails_helper' #use rails' built in helper methods

RSpec.describe ProjectsController, type: :controller do #test fot the project controller; it should do the following
    context "GET #index" do #when calling the index method with the get command ...
        it "returns a success response" do
            get :index
            # the response of this call should be successful. i.e projects variable in the project controller should equal all the projects in the database
            expect(response).to be_successful
        end
    end

    #the above test checked if the project controller is able to access the database

    context "Get #show" do
    #when calling the method show from a get request...
        let!(:project) { Project.create(title: "Test title", description: "Test Description") } #create a dummy project to run a test on
        it "returns a success response" do
            get :show, params: { id: project } #in response to show call, there should be a successful response displaying the project
            expect(response).to be_successful
        end
    end
end