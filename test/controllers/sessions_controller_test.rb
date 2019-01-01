require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  describe 'POST #create' do
    context 'when password is invalid' do
      it 'renders the page with error' do
        user = create(:user)
        post :create, session: { username: user.username, password: 'invalid' }
        expect(response).to render_template(:new)
        expect(flash[:notice]).to match(/^Invalid username or password/)
      end
    end

    context 'when password is valid' do
      it 'sets the user in the session and redirects them to their dashboard' do
        user = create(:user)
        post :create, session: { username: user.username, password: user.password }
        expect(response).to redirect_to '/user/:id'
        expect(controller.current_user).to eq user
      end
    end
  end # end of POST#create

end # end of SessionsControllerTest
