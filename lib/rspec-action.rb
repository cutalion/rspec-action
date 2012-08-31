require "rubygems"
require "rspec"
require "rspec-action/version"

module RSpec
  module Core
    module Hooks
      def action(&block)
        around do |ex|
          self.class.remove_previous_action &block
          self.class.before &block unless self.class.action_added?(&block)
          self.class.hooks[:before][:each].last.instance_eval do
            def action_hook?; true; end
          end
          ex.run
        end
      end

      def remove_previous_action(&block)
        ancestors.each do |ancestor|
          ancestor.hooks[:before][:each].delete_if {|hook| hook.respond_to?(:action_hook?)}
        end
      end

      def action_added?(&block)
        ancestors_hooks = ancestors.reverse.map { |ancestor| ancestor.hooks[:before][:each] }.flatten
        ancestors_hooks.map(&:to_proc).include? block
      end
    end
  end
end
