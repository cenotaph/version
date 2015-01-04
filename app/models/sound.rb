class Sound < ActiveRecord::Base
  mount_uploader :soundfile, SoundfileUploader
  include Item
  before_save :update_asset_attributes

  def rss_out
    short_description.html_safe
  end

  private
  
  def update_asset_attributes
    if soundfile.present?
      self.soundfile_content_type = soundfile.file.content_type
      self.soundfile_file_size = soundfile.file.size
    end      
  end
  
end
