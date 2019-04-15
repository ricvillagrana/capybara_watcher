module CapybaraWatcher
  module Configuration
    class << self
      def options
        @options ||= {
          timeout: 2
        }
      end

      def options=(options = nil)
        @options = options unless options.nil?
      end
    end
  end
end
