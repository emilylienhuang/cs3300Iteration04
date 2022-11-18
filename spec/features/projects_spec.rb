require 'rails_helper' #using rails helper methods

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    #when you click to create a new project (this will be executed before all the tests)
    #so there will be a dummy project used for all the tests
    before (:each) do
      #each time you do so you visit a new project path 
      visit new_project_path
      within("form") do
        #there will be a form there, and it will fill in title with test title
        fill_in "Title", with: "Test title"
      end
    end #that will conclude how we define our dummy project
  
    scenario "should be successful" do
      fill_in "Description", with: "Test description" #if in our dummy project description field is able to be filled in with a test description...
      click_button "Create Project"
      #when you click the button to create a project, it is expected that the page will display
      #project was successfully created
      expect(page).to have_content("Project was successfully created")
    end
  
    scenario "should fail" do
      click_button "Create Project"
      #if the user clicks create project, and the description is blank
      #then the page should display a message that the description can't be blank
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do 
    #running tests on updating project
    let(:project) { Project.create(title: "Test title", description: "Test content") } #create a dummy project and let this refer to project
    before(:each) do
      #for each run of this test, 
      visit edit_project_path(project) #visit the project path to edit the project, will be nil if unable to do so
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
        #project creation should be successful given that 
        #in the project creation form the description field is able to be filled in with new description content
      end
      click_button "Update Project"
      #when you click the button to update the project, the web page should display a message the the project was updated successfully
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end
  #above, project creation would fail  if the descrition field was entered in blank on the form
  #when you click the button to update the project the error Description can't be blank should be displayed on the screen

# Add the following code but comment it out. We are working on getting this to work
#  context "Remove existing project" do
#    let!(:project) { Project.create(title: "Test title", description: "Test content") }
#    scenario "remove project" do
#      visit project_path('1')
#      click_link "Destroy this project"
#      expect(page).to have_content("Project was successfully destroyed")
#      expect(Project.count).to eq(0)
#    end
#  end
end