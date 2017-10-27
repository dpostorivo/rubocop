# frozen_string_literal: true

require 'pp'
module RuboCop
  module Cop
    module Lint
      # TODO: Write cop description and example of bad / good code.
      #
      # @example
      #   # bad
      #   bad_method()
      #
      #   # bad
      #   bad_method(args)
      #
      #   # good
      #   good_method()
      #
      #   # good
      #   good_method(args)
      class AmbiguousRange < Cop
        # TODO: Implement the cop into here.
        #
        # In many cases, you can use a node matcher for matching node pattern.
        # See. https://github.com/bbatsov/rubocop/blob/master/lib/rubocop/node_pattern.rb
        #
        # For example
        MSG = 'Message of AmbiguousRange'.freeze

        def_node_matcher :bad_method?, <<-PATTERN
          (send nil :bad_method ...)
        PATTERN

        def on_irange(node)
          pp node


          return unless bad_method?(node)
          add_offense(node)
        end
      end
    end
  end
end
