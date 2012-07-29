class Chef
  class Recipe
    def use_brew?
      Chef::Platform.find_provider_for_node(node, :package) == Chef::Provider::Package::Homebrew
    end
  end
end
