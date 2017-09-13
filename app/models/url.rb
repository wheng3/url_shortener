class Url < ApplicationRecord
	before_create :shorten
	validates :short_url, uniqueness: true
	validates :long_url, presence: true
	validates_format_of :long_url, :with => URI::regexp(%w(http https))

	def shorten
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']
		shortened_string = Array.new(7){ range.sample }.join
		self.short_url = shortened_string
	end
end
