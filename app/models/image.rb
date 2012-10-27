class Image < ActiveRecord::Base
  # Relations
  has_many :image_relations, :dependent => :destroy


  # Paperclip
  has_attached_file :image, :styles => {
    :original => ["1024>", :jpg],
    :front => ["768x348#", :jpg],
    :thumb => ["120x120#", :jpg]
  }, :url => "/uploads/images/:id/:style.:extension"

  # Validation
  validates_length_of :name, :maximum => 50

  # Paperclip Validation
  include PaperclipValidator
  validates_paperclip_presence :image
  validates_paperclip_content_type :image, :content_type => /image\/jpeg|image\/png|image\/gif|image\/pjpeg|image\/x-png/
  validates_paperclip_size :image, :less_than => 10.megabytes

  # Mass-assignment
  attr_accessible :name, :source, :image, :crop_x, :crop_y, :crop_w, :crop_h, :thumbnail



  # Cropper
  include Cropper

  # Methods
  def image_size(style)
    case style
      when :thumb then width, height = 120, 120
      when :front then width, height = 768, 348
    end
    "#{width}x#{height}#"
  end

  def extract_zip_or_save
    if image?
      self.save
    elsif zip?
      extract_zip
    end
  end

  def image?
    %w(image/jpeg image/png image/gif image/pjpeg image/x-png).include?(image_content_type)
  end

  def zip?
    %w(application/zip).include?(image_content_type)
  end

  def allow_only_images
    return false unless image?
  end

  def extract_zip
    dir = Dir.mktmpdir
    begin
      Archive::Zip.extract(image.queued_for_write[:original].path, dir)

      Dir.entries(dir).each do |entry|
        next if !entry.match(/\.jpg|\.jpeg|\.gif|\.png$/i)
        Image.create(:image => File.open(File.join(dir, entry)), :name => name)
      end

      true
    rescue
      false
    ensure
      FileUtils.remove_entry_secure(dir)
      GC.start
    end
  end

  def url(style)
    image.url(style)
  end
end
