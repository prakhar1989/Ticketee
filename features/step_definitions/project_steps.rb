Given /^there is a project called "([^\"]*)"$/ do |this_name|
  Factory(:project, :name => this_name)
end
