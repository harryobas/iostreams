require 'io_streams/version'
#@formatter:off
module IOStreams
  module Bzip2
    autoload :Reader, 'io_streams/bzip2/reader'
    autoload :Writer, 'io_streams/bzip2/writer'
  end
  module File
    autoload :Reader, 'io_streams/file/reader'
    autoload :Writer, 'io_streams/file/writer'
  end
  module Gzip
    autoload :Reader, 'io_streams/gzip/reader'
    autoload :Writer, 'io_streams/gzip/writer'
  end
  autoload :Pgp,      'io_streams/pgp'
  module S3
    autoload :Reader, 'io_streams/s3/reader'
    autoload :Writer, 'io_streams/s3/writer'
  end
  module SFTP
    autoload :Reader, 'io_streams/sftp/reader'
    autoload :Writer, 'io_streams/sftp/writer'
  end
  module Zip
    autoload :Reader, 'io_streams/zip/reader'
    autoload :Writer, 'io_streams/zip/writer'
  end

  module Line
    autoload :Reader, 'io_streams/line/reader'
    autoload :Writer, 'io_streams/line/writer'
  end
  module Record
    autoload :Reader, 'io_streams/record/reader'
    autoload :Writer, 'io_streams/record/writer'
  end
  module Row
    autoload :Reader, 'io_streams/row/reader'
    autoload :Writer, 'io_streams/row/writer'
  end
  module Xlsx
    autoload :Reader, 'io_streams/xlsx/reader'
  end

  autoload :Tabular, 'io_streams/tabular'
end
require 'io_streams/io_streams'
