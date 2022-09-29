require 'rails_helper'

RSpec.describe ElementsController, type: :controller do
    # CREATE TESTING: Testing the create function
    describe 'create controllers' do
        # CONTEXT: Checking the permit params
        context 'permit check' do
            it 'should test param(s) to be permitted' do
                params = {
                    element: { power: "Grass" }
                }
                should permit(:power).
                    for(:create, params: params).
                    on(:element)
            end
        end

        # CREATE Success & Check it exist
        context 'successfully create (GOOD DATA)' do
            it 'should create the type successfully & check its exist' do
                post :create, params: { element: { power: "Fairy" } }
                expect(Element.count).to eq(1)  
            end
        end

        # CREATE Fail
        context 'failing create (BAD DATA)' do
            it 'should fail on create w/ bad data' do
                post :create, params: { element: { power: 100 } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    # INDEX TEST: Testing the index see if it able to fetch all typings
    describe 'get index' do
        # INDEX display
        context 'test the index' do
            it 'should display all types from the Element object' do
              get :index
              expect(response).to have_http_status(:ok)
            end
        end
    end

    # DESTROY TESTING: Testing if the destroy method fully destroy an entry
    describe 'delete controller' do
        # Create a variable to test out the destroy method
        let(:type_del) { Element.create(power: "Steel", id: 1) }

        # DELETE content and it is success in deleting
        context 'delete method success' do
            it 'should delete a type' do
                delete :destroy, params: { id: type_del.id }
                expect(Element.count).to eq(0)
            end
        end

        # DELETE content and redirect
        context 'delete method & redirect' do
            it 'should delete a type & redirect' do
                delete :destroy, params: { id: type_del.id }
                expect(response).to redirect_to(elements_url)
            end
        end
    end

    # UPDATE TESTING: Testing the update function
    describe 'update controller' do
        # Create the variable to test out the update function
        let(:type_tst) { Element.create(power: "Grass", id: 1) }

        # CONTEXT: Check to see the update functionality work
        context 'check on update' do    
            it 'should update the type & see content change' do
                patch :update, params: {id: type_tst.id, element: { power: "Ice"}}
                type_tst.reload
                expect(type_tst.power).to eq("Ice")
            end
        end

        # CONTEXT: Type update with 'good' data & pass redirect
        context 'update type (GOOD DATA)' do
            it 'should updates the type & redirects' do
                patch :update, params: {id: type_tst.id, element: { power: "Electric"}}
                expect(response).to redirect_to(element_url(type_tst))
            end
        end

        # CONTEXT: Type update with 'bad' data & not redirect
        context 'update type & error (BAD DATA)' do
            it 'should not be updating the type & give error' do
                patch :update, params: { id: type_tst.id, element: { power: 20 } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end