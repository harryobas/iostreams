module IOStreams
  module Row
    # Converts each line of an input stream into an array for every line
    class Reader
      # Read a line as an Array at a time from a file or stream.
      def self.open(file_name_or_io, delimiter: nil, buffer_size: 65536, encoding: UTF8_ENCODING, strip_non_printable: false, **args)
        if file_name_or_io.is_a?(String)
          IOStreams.line_reader(file_name_or_io,
                                delimiter:           delimiter,
                                buffer_size:         buffer_size,
                                encoding:            encoding,
                                strip_non_printable: strip_non_printable) do |io|
            yield new(io, **args)
          end
        else
          yield new(file_name_or_io, **args)
        end
      end

      # Create a Tabular reader to return the stream rows as arrays.
      #
      # Parameters
      #   delimited: [#each]
      #     Anything that returns one line / record at a time when #each is called on it.
      #
      #   format: [Symbol]
      #     :csv, :hash, :array, :json, :psv, :fixed
      #
      #   For all other parameters, see Tabular::Header.new
      def initialize(delimited, cleanse_header: true, **args)
        @tabular        = IOStreams::Tabular.new(**args)
        @delimited      = delimited
        @cleanse_header = cleanse_header
      end

      def each
        delimited.each do |line|
          if tabular.requires_header?
            columns = tabular.parse_header(line)
            tabular.cleanse_header! if cleanse_header
            yield columns
          else
            yield tabular.row_parse(line)
          end
        end
      end

      private

      attr_reader :tabular, :delimited, :cleanse_header
    end
  end
end
