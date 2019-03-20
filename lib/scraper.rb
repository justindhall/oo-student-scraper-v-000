require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    learn = Nokogiri::HTML(open(index_url))

    students = []

    #iterate through students

    learn.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        student_profile_link = "#{student.attr('href')}"
        student_name = student.css('.student-name').text
        student_location = student.css('.student-location').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end

    students
    #students list: "div.roster-cards-container"
    #individual cards: "div.student-card"
    #name: "div.student-name"
    #location: "div.student-location"
    #profile_url: "./fixtures/student-site/students/#{student.attr('href')}"

    #binding.pry
  end

  def self.scrape_profile_page(profile_url)
    profile_page = Nokogiri::HTML(open(profile_url))
    
    student = {}
    
    student
    
    #social-links: ".social-icon-container"
    #twitter: ""
  end

end
