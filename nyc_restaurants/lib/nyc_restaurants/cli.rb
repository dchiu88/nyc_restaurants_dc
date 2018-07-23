class NycRestaurants::CLI
  def start
    puts "Welcome to NYC Restaurants"
    puts ""
    #display list
    NycRestaurants::Scraper.scrape_restaurants
    main_menu
  end


    def main_menu
      puts "Here are all the restaurants that are reviewed"
      restaurants = NycRestaurants::Restaurants.all

      restaurants.each.with_index(1) do |restaurant, index|
      puts "#{index}. #{restaurant.name}"
    end

    puts ""
    puts "Please select a restaurant to view additional details:"

    input = gets.strip
    index = input.to_i - 1

    restaurant = NycRestaurants::Restaurants.all[index]

    NycRestaurants::Scraper.scrape_restaurant_details(index)

    puts "Here are the details:"
    puts  NycRestaurants::Scraper.scrape_restaurant_details(index)
    puts ""
    main_menu
  end
end
