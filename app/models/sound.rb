class Sound < ActiveRecord::Base
  mount_uploader :soundfile, SoundfileUploader
  include Item

end
