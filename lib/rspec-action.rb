require "rspec-action/version"

module RSpec
  module Core
    module Hooks
      def action(&block)
        before { self.class.before(&block) unless self.class.action_added?(&block) }
      end

      def action_added?(&block)
        hooks[:before][:each].map(&:to_proc).include? block
      end
    end
  end
end
