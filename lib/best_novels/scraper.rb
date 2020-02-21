class BestNovels::Scraper
  def self.scrape_novels
    site = "https://www.theguardian.com/books/2015/aug/17/the-100-best-novels-written-in-english-the-full-list"
    doc = Nokogiri::HTML(open(site))
    novels = doc.css("div.content__article-body.from-content-api.js-article__body p strong")
    novels.each do |n|
      title = n.css("a.u-underline").text.strip
      url = n.css("a").attr("href").value
      BestNovels::Novel.new(title, url)
   end
  end


  def self.scrape_key_info(novel)
  url = "#{novel.url}"
  doc = Nokogiri::HTML(open(url))
  ps = doc.css("div.content__article-body.from-content-api.js-article__body")
  ps.each do |p|
    info = p.css(p).text
    novel.key_info << info
  end
end
end
