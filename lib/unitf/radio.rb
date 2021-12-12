# frozen_string_literal: true

require_relative "radio/version"

module UnitF
  module Radio
    class Error < StandardError; end

    class << self
      def base_dir
        @base_dir ||= '/tmp'
      end

      def base_dir=(base_dir)
        @base_dir = base_dir
      end
    end
  end
end
