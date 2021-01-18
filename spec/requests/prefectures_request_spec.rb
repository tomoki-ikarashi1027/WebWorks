require 'rails_helper'

RSpec.describe "prefectures", type: :request do
  describe 'トップページ' do
    context "トップページが正しく表示される" do
      before do
         get prefectures_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されること' do
        expect(response.body).to include('全国の都道府県から探す')
      end
    end
  end
end