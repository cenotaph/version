
module CarrierWave
  module Uploader
    module Versions
      private
      def full_filename(for_file)
        super(for_file)
      end
    end
  end
end