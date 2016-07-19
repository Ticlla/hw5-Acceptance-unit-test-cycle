require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'Get similar' do
      context 'has valid director' do
          before(:each) do
            allow(Movie).to receive(:find).and_return(
                double(:movie, id:5, title:'dummy', director:'dummy director')
            )
          end    
          
            
          it 'is a valid action' do
              get :similar, id: 5
          end
          
          it 'gets a movie' do
              expect(Movie).to receive(:find)
              get :similar, id: 5
          end
          
          it 'searches by director' do
            expect(Movie).to receive(:where).with(director:'dummy director')
            get :similar, id: 5
          end
      end
      
      context 'does not have valid director' do
        before(:each) do
          allow(Movie).to receive(:find).and_return(
             double(:movie, id:5, title:'dummy', director:'')
          )
        end 
        
        it 'does not search by director' do
            expect(Movie).to_not receive(:where)
            get :similar, id: 5
        end
        
        it 'redirects to index' do
            get :similar, id: 5
            expect(response).to redirect_to(movies_path)
        end
        
        it 'shows flash warning message' do 
            get :similar, id: 5
            expect(flash[:warning]).to match /has no director info/
        end
        
      end
      
      #'Alien' has no director info
      
        
    end
end