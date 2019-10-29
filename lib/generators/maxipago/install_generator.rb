require 'rails/generators'

module Maxipago
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy Maxipago initializer file"
      source_root File.expand_path('../templates',__FILES__)

      def copy_maxipago_config_file
        puts "copy maxipago.rb in /config/initializers"
        copy_file "maxipago_config_template.rb", "config/initializers/maxipago.rb"
      end
    end
  end
end