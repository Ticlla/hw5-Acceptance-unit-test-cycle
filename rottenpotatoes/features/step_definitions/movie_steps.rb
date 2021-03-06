Given /the following movies exist:/ do |movies_table|
    movies_table.hashes.each do |movie|
        Movie.create! movie
    end
end
    
    
Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |title, director|
  @movie=Movie.where(title: title).first;
  expect(@movie.director).to eql director
end    