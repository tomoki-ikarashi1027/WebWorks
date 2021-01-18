require 'rails_helper'

describe '管理者の認証テスト' do
  let(:user) { create(:user) }
  describe '管理者登録' do
    before do
      visit new_admin_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'admin[email]', with: Faker::Internet.email
        fill_in 'admin[password]', with: 'password'
        fill_in 'admin[password_confirmation]', with: 'password'
        click_button 'Sign up'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it '新規登録に失敗する' do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        fill_in 'admin[password_confirmation]', with: ''
        click_button 'Sign up'
        expect(page).to have_content 'adminは保存されませんでした。'
      end
    end
  end
  describe '管理者ログイン' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_admin) { admin }
      it 'ログインに成功する' do
        fill_in 'admin[email]', with: test_admin.email
        fill_in 'admin[password]', with: test_admin.password
        click_button 'Log in'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインに失敗する' do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'Log in'
        expect(current_path).to eq(new_admin_session_path)
      end
    end
  end
end
describe '管理者側の機能テスト' do
  before do
    visit new_admin_registration_path
    fill_in 'admin[email]', with: Faker::Internet.email
    fill_in 'admin[password]', with: 'password'
    fill_in 'admin[password_confirmation]', with: 'password'
    click_button 'Sign up'
  end
  context '表示の確認' do
    it 'Mailリンクを表示' do
      expect(page).to have_content 'Mail'
    end
    it 'Reviewsリンクを表示' do
      expect(page).to have_content 'Reviews'
    end
    it 'Companyリンクを表示' do
      expect(page).to have_content 'Company'
    end
    it 'Languageリンクを表示' do
      expect(page).to have_content 'Language'
    end
  end
  context 'リンクの確認' do
    it 'Mailリンクの遷移' do
      visit admins_contacts_path
      expect(page).to have_content 'お問い合わせ一覧'
    end
    it 'Reviewsリンクの遷移' do
      visit admins_post_comments_path
      expect(page).to have_content '投稿コメント一覧'
    end
    it 'Companyリンクの遷移' do
      visit admins_prefectures_path
      expect(page).to have_content '北海道'
    end
    it 'Languageリンクの遷移' do
      visit admins_language_tags_path
      expect(page).to have_content 'フレームワーク'
    end
  end
  context 'タグが追加・削除ができる' do
    before do
      visit admins_language_tags_path
    end
    it 'プログラミング言語を追加できる' do
      fill_in 'language_tag[language]' ,with: Faker::Lorem.characters(number: 5)
      find('.language').click
      expect(page).to have_content 'successfully'
    end
    it 'フレームワークを追加できる' do
      fill_in 'framework_tag[framework]' ,with: Faker::Lorem.characters(number: 5)
      find('.framework').click
      expect(page).to have_content 'successfully'
    end
    it 'プログラミング言語を削除できる' do
      language = LanguageTag.create!(id: 1, language: 'javascript')
      expect { language.destroy }.to change { LanguageTag.count }.by(-1)
    end
    it 'フレームワークを削除できる' do
      framework = FrameworkTag.create!(id: 1, framework: 'vue.js')
      expect { framework.destroy }.to change { FrameworkTag.count }.by(-1)
    end
  end
  context '都道府県ページの確認' do
    let!(:prefecture) { create(:prefecture) }
    let!(:company) { create(:company, prefecture: prefecture) }
    before do
      @prefecture = FactoryBot.create(:prefecture)
      visit admins_prefectures_path
    end
    it '遷移できる' do
      expect(current_path).to eq admins_prefectures_path
    end
    it '表示の確認' do
      expect(page).to have_content '北海道・東北'
    end
    it '遷移できる' do
      visit admins_prefecture_path(@prefecture)
      expect(current_path).to eq admins_prefecture_path(@prefecture)
    end
    context '企業を追加できる' do
      before do
        visit new_admins_company_path
      end
      it '追加に成功する' do
        find("#company_prefecture_id").find("option[value='1']").select_option
        fill_in 'company[company_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'company[address]', with: Faker::Lorem.characters(number: 10)
        fill_in 'company[phone_number]', with: 1111111111
        fill_in 'company[description]', with: Faker::Lorem.characters(number: 10)
        click_button 'Create Company'
      end
      it '追加に失敗する' do
        find('#company_prefecture_id').set('')
        fill_in 'company[company_name]', with: ''
        fill_in 'company[address]', with: ''
        fill_in 'company[phone_number]', with: ''
        fill_in 'company[description]', with: ''
        click_button 'Create Company'
        expect(page).to have_content 'エラー'
      end
    end
    context 'レビューの管理' do
      user = FactoryBot.create(:user)
      prefecture = FactoryBot.create(:prefecture)
      company = FactoryBot.create(:company, prefecture: prefecture)
      before do
        @review = PostComment.create!(comment: "testコメント" ,score: 1, gender: 1, employment_status: 1,company_id: 1,  user_id: 1)
        visit admins_post_comments_path
      end
      it 'showリンクから遷移できる' do
        visit admins_post_comment_path(@review)
        expect(page).to have_content '点'
      end
      it "レビューを削除できる" do
        expect { @review.destroy }.to change { PostComment.count }.by(-1)
        expect(current_path).to eq admins_post_comments_path
      end
    end
  end
end