module Berkshelf
  class BaseFormatter
    #
    # @macro formatter_method
    #   @method $1(*args)
    #     Create a formatter method for the declaration
    #
    def self.formatter_method(name)
      class_eval <<-EOH, __FILE__, __LINE__ + 1
        def #{name}(*args)
          raise AbstractFunction,
            "##{name} must be implemented on \#{self.class.name}!"
        end
      EOH
    end

    # UI methods
    formatter_method :deprecation
    formatter_method :error
    formatter_method :msg
    formatter_method :warn

    # Object methods
    formatter_method :fetch
    formatter_method :install
    formatter_method :list
    formatter_method :outdated
    formatter_method :package
    formatter_method :skip
    formatter_method :show
    formatter_method :upload
    formatter_method :use
    formatter_method :vendor
    formatter_method :version

    # The cleanup hook is defined by subclasses and is called by the CLI.
    def cleanup_hook; end
  end
end
