class BestNovels::Novel
@@all = []
attr_accessor :title

def initialize(title)
  @title = title
  save
end

def self.all
  BestNovels::Scraper.scrape_novels if @@all.empty?
  @@all
end

def save
  @@all << self
end
end
