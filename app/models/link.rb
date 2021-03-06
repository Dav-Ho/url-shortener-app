class Link < ActiveRecord::Base
  has_many :visits
  belongs_to :user

  validates :slug, presence: true
  validates :target_url, presence: true

  def standarize_target_url!
    self.target_url.gsub!("http://", '')
    self.target_url.gsub!('http://', "")
  end

  def visit_count
    self.visits.count
  end
end
