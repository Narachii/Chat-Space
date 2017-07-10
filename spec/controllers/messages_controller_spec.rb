require 'rails_helper'


describe MessagesController,type: :controller do
  let(:user) {create(:user)}
  let(:group) {build(:group)}
  let(:message) {build(:message)}
  let(:invalid_message) {build(:invalid_message)}
  render_views

    describe 'GET #index' do
      before do
        get :index, params:{group_id: group}
      end
      context " user_not _loged_in" do
        it "redirects to the view for sign_in " do
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "user loged_in" do
        before do
          login_user user
          get :index, params:{group_id: group}
        end

        it "assigns the requested contact to @group" do
          expect(assigns(:group)).to eq group
        end

        it "assigns the requested contract to @message" do
          message = Message.new
          expect(message).to be_a_new(Message)
        end

        it "assigns the requested contract to @messages" do
          messages = group.messages
          expect(assigns(:messages)).to match(messages.sort{|a, b| b.created_at <=> a.created_at })
        end

        it "displays all the messages" do
          expect(response.body).to include(group.messages[0][:body],group.messages[1][:body],group.messages[2][:body])
        end

        it "displays all the images" do
          expect(response.body).to include(group.messages[0][:image],group.messages[1][:image],group.messages[2][:image])
         end
       end
     end

    describe '#create' do
      context " user_not _loged_in" do
        it "redirects to the view for sign_in " do
          post :create, params:{group_id: group}
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context "user loged_in" do
        before do
          login_user user
          post :create, params:{group_id: group, message:attributes_for(:message)}
        end

        it "assigns the requested contact to @group" do
        expect(assigns(:group)).to eq group
        end

        it "saves the new message in the database" do
         expect {post :create, params:{group_id: group, message:attributes_for(:message)}}.to change(Message,:count).by(1)
        end

        it "redirects to articles#index" do
          expect(response).to redirect_to (group_messages_path)
        end

        context "false case" do
          before do
          post :create, params:{group_id: group, message:attributes_for(:invalid_message)}
        end

          it "unsave the new message in the database" do
            expect {create(:invalid_message)}.to raise_error(ActiveRecord::RecordInvalid)
          end

          it "displays flash message" do
          expect(flash[:alert]).to be_present
          end
        end
      end
    end
end
