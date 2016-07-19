require 'rails_helper'

describe 'movies/edit' do
    it 'has director field' do
        assign(:movie,
            double(:movie, title: 'dummy title', id: 5))
        render
        expect(rendered).to have_field('movie[director]')
    end
end