require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
    # CREATE TESTING: Testing the create function
    describe 'create controller' do
        # CONTEXT: Checking the permit params
        context 'permit check' do
            it 'should test param(s) to be permitted' do
                params = {
                    pokemon: { name: "Pikachu", ability: "Static", male_chance: 50, female_chance: 50, height: 0.4, weight: 13.2 }
                    }
                should permit(:name, :ability, :male_chance, :female_chance, :height, :weight).
                    for(:create, params: params).
                    on(:pokemon)
            end
        end

        # CREATE Success & Check it exist
        context 'successfully create (GOOD DATA)' do
            it 'should create the pokemon successfully & check its exist' do
                post :create, params: { pokemon: { name: "Chimchar", ability: "Blaze", male_chance: 88, female_chance: 12, height: 0.5, weight: 13.7 } }
                expect(Pokemon.count).to eq(1)  
            end
        end

        # CREATE Fail
        context 'failing create (BAD DATA)' do
            it 'should fail on create w/ bad data' do
                post :create, params: { pokemon: { name: "Chimchar", ability: 100, male_chance: 88, female_chance: 12, height: 0.5, weight: 13.7 } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    # INDEX TEST: Testing the index see if it able to fetch all typings
    describe 'get index' do
        # INDEX display
        context 'test the index' do
            it 'should display all types from the Pokemon object' do
              get :index
              expect(response).to have_http_status(:ok)
            end
        end
    end

    # DESTROY TESTING: Testing if the destroy method fully destroy an entry
    describe 'delete controller' do
        # Create a variable to test out the destroy method
        let(:poke_del) { Pokemon.create(name: "Pikachu", ability: "Static", id: 1) }

        # DELETE content and it is success in deleting
        context 'delete method success' do
            it 'should delete a pokemon' do
                delete :destroy, params: { id: poke_del.id }
                expect(Pokemon.count).to eq(0)
            end
        end

        # DELETE content and redirect
        context 'delete method & redirect' do
            it 'should delete a pokemon & redirect' do
                delete :destroy, params: { id: poke_del.id }
                expect(response).to redirect_to(pokemons_url)
            end
        end
    end

    # UPDATE TESTING: Testing the update function
    describe 'update controller' do
        # Create the variable to test out the update function
        let(:poke_tst) { Pokemon.create(name: "Piplup", ability: "Torrent", id: 1) }

        # CONTEXT: Check to see the update functionality work
        context 'check on update' do    
            it 'should update the type & see content change' do
                patch :update, params: { id: poke_tst.id, pokemon: { name: "Prinplup", ability: "Torrent" } }
                poke_tst.reload
                expect(poke_tst.name).to eq("Prinplup")
            end
        end

        # CONTEXT: Type update with 'good' data & pass redirect
        context 'update type (GOOD DATA)' do
            it 'should updates the type & redirects' do
                patch :update, params: {id: poke_tst.id, pokemon: { name: "Prinplup"}}
                expect(response).to redirect_to(pokemon_url(poke_tst))
            end
        end

        # CONTEXT: Type update with 'bad' data & not redirect
        context 'update type & error (BAD DATA)' do
            it 'should not be updating the type & give error' do
                patch :update, params: { id: poke_tst.id, pokemon: { ability: 20 } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end