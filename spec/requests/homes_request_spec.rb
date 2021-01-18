require 'rails_helper'

RSpec.describe "homes", type: :request do
  describe 'トップページ' do
    let(:user) { create(:user) }
    context "トップページが正しく表示される" do
      before do
         get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されること' do
        expect(response.body).to include('転職先を見つけよう')
      end
      it 'タイトルが正しく表示されること' do
        expect(response.body).to include('仕事を変えよう')
      end
    end
  end
  describe 'aboutページ' do
    context "aboutページが正しく表示される" do
      before do
        get homes_about_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されること' do
        expect(response.body).to include('仕事を変えて世界を変える。')
      end
    end
  end
  describe 'taskページ' do
    context "taskページへ遷移できない" do
      before do
        get homes_task_path
      end
      it 'リクエストは302となること' do
        expect(response.status).to eq 302
      end
    end
  end
  describe 'memoページ' do
    context "memotページへ遷移できない" do
      before do
        get homes_memo_path
      end
      it 'リクエストは302となること' do
        expect(response.status).to eq 302
      end
    end
  end
end