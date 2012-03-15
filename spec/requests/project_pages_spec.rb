require 'spec_helper'

describe "ProjectPages" do

  describe "index page" do

    it "should have heading 'All Projects'" do
      visit root_path
      page.should have_selector('h2', 'Projects')
    end

  end

  describe "new page" do

    it "should have heading new project" do
      visit '/projects/new'
      page.should have_content('New Project')
    end
  end

end
