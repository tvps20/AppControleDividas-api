require 'rails_helper'

RSpec.describe 'Users API', type: :request do
    # Cria o obj assim que o teste é iniciado, coloca no banco.
    let!(:user) {create(:user)}
    let(:user_id) {user.id}

    before { host! "api.taskmanager.dev"}

    describe "GET /users/:id" do
        before do
            headers = {"Accept" => "application/vnd.taskmanager.v1"}
            get "/users/#{user_id}", params: {}, headers: headers
        end

        # Agrupa teste que tem algo em comum
        context 'when the user exist' do
            it "returns the user" do
                user_response = JSON.parse(response.body)
                expect(user_response["id"]).to eq(user_id)
            end

            it "returns status code 200" do
                expect(response).to have_http_status(200)
            end
        end

        context "when the user does not exist" do
            let(:user_id) {10000}

            it "returns status code 404" do
                expect(response).to have_http_status(404)
            end
        end

    end

end