class BestNovels::Novel
  attr_accessor :title, :url, :key_info
@@all = []

def initialize(title, url)
  @title = title
  @url = url
  @key_info = []
  save
end

def self.all
  BestNovels::Scraper.scrape_novels if @@all.empty?
  @@all
end

def get_novel_details
BestNovels::Scraper.scrape_key_info(self)
 end

def save
  @@all << self
end
end
