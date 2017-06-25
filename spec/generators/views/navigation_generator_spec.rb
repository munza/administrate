require "spec_helper"
require "generators/administrate/views/navigation_generator"
require "support/generator_spec_helpers"

describe Administrate::Generators::Views::NavigationGenerator, :generator do
  describe "administrate:views:navigation" do
    it "copies the navigation partial into the `admin/application` namespace" do
      expected_contents = contents_for_application_template("_navigation")
      generated_file = file("app/views/admin/application/_navigation.html.erb")

      run_generator []

      contents = File.read(generated_file)
      expect(contents).to eq(expected_contents)
    end

    it "copies the navigation partial into the `module/application` namespace when module options is specified" do
      expected_contents = contents_for_application_template("_navigation")
      generated_file = file("app/views/backend/application/_navigation.html.erb")

      run_generator ["--module", "Backend"]

      contents = File.read(generated_file)
      expect(contents).to eq(expected_contents)
    end
  end
end
