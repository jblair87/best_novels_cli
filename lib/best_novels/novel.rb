class BestNovels::Novel
@@all = []
attr_accessor :title, :url, :details

def initialize(title, url)
  @title = title
  @url = url
  @details = []
  save
end

def self.all
  BestNovels::Scraper.scrape_novels if @@all.empty?
  @@all
end

def get_novel_details
BestNovels::Scraper.scrape_key_info(self) if @key_info.empty?
 end

def save
  @@all << self
end
end
