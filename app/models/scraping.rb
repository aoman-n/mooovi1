 class Scraping

  def self.movie_urls
    agent = Mechanize.new
    links = []
    next_url = ""

    while true do
      page = agent.get("http://review-movie.herokuapp.com/" + next_url )
      element = page.search('.entry-title a')
      element.each do |ele|
        links << ele[:href]
      end

      next_link = page.at('.next a')
      break unless next_link
      next_url = next_link[:href]
    end

      links.each do |link|
        get_product( "http://review-movie.herokuapp.com/" + link)
      end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.entry-title').inner_text
    image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img')
    detail = page.at('.entry-content p').inner_text if page.at('.entry-content p')
    director = page.at('.director span').inner_text if page.at('.director span')
    open_date = page.at('.date span').inner_text if page.at('.date span')
    product = Product.where(title:title).first_or_initialize
    product[:image_url] = image_url
    product[:detail] = detail
    product[:director] = director
    product[:open_date] = open_date
    product.save
  end

end
