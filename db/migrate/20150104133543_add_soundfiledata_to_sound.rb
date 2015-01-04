class AddSoundfiledataToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :soundfile_file_size, :integer, :length => 8
    add_column :sounds, :soundfile_content_type, :string
    Sound.all.each do |s|
      s.soundfile_content_type = `file -Ib #{Rails.root.to_s + "/public" + s.soundfile.file.path}`.split(';').first
      s.soundfile_file_size = File.open(Rails.root.to_s + "/public" + s.soundfile.file.path).size
      s.save!
    end
  end
end
