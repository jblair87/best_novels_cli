class BestNovels::Novel
  #Create accessor methods for all variables given
  attr_accessor :title, :url, :review
  #class variable
@@all = []

def initialize(title, url)
  #instance variables
  @title = title
  @url = url
  save
end
#class method
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
