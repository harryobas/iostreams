require 'json'
module IOStreams
  module Tabular
    module Parser
      class Hash < Base
        def parse(row)
          # return if row.blank?
          raise(Tabular::Errors::TypeMismatch, "Format is :hash. Invalid input: #{row.class.name}") unless row.is_a?(::Hash)
          row
        end

        def render(row, header)
          header.to_hash(row)
        end

        def requires_header?
          false
        end
      end
    end
  end
end