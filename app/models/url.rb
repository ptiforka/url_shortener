require 'securerandom'

class Url < ApplicationRecord
  validates_format_of :original_url,
                      with: %r{\A(https?://)?([\da-z\.-]+)\.([a-z\.]{2,6})([/\w\.-]*)*/?\Z}i
  validates :original_url, presence: true
  before_create :generate_short_url

  def generate_short_url
    url =  SecureRandom.hex(3)
    if Url.find_by_short_url(url)
      generate_short_url
    else
      self.short_url = url
    end
  end
end
