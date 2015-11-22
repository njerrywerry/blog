class Article < ActiveRecord::Base
  scope :draft, ->{ where(published_at: nil) }
  scope :published, ->{ where.not(published_at: nil).where("published_at <= ?", Time.zone.now) }
  scope :scheduled, ->{ where.not(published_at: nil).where("published_at > ?", Time.zone.now) }

  attr_accessor :status

  before_validation :clean_up_status

  def clean_up_status
    self.published_at = case status
                        when "Draft"
                          nil
                        when "Published"
                          Time.zone.now
                        else
                          published_at
                        end
    true
  end


  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :title, presence: true
  validates :body, presence: true

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect {|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(",")
  end


end
