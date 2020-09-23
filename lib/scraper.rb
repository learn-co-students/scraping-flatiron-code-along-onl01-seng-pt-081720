require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    page = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(page)
  end

  def get_courses
    get_page.css("html body div #main #course-grid section article h2")
  end

  def make_courses
    get_courses.each do |course|
      Course.new(course. title, course.schedule, course.description)
    end
  end
  
end



