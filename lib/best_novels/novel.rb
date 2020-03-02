class BestNovels::Novel
  attr_accessor :title, :url, :review
@@all = []

def initialize(title, url)
  @title = title
  @url = url
  #@key_info = []
  save
end

def self.all
  BestNovels::Scraper.scrape_novels if @@all.empty?
  @@all
end

def get_novel_details
BestNovels::Scraper.scrape_review(self)
 end

def save
  @@all << self
end
end
