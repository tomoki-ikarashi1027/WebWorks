require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'Sign up'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it '新規登録に失敗する' do
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button 'Sign up'
        expect(page).to have_content 'ユーザーは保存されませんでした。'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'Log in'
        expect(page).to have_content 'ログインしました。'
      end
      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'Log in'
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end
describe 'ユーザーの機能' do
  let!(:user) { create(:user) }
  let!(:prefecture) { create(:prefecture) }
  let!(:company) { create(:company, prefecture: prefecture) }
  before do
    visit new_user_registration_path
    fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
    fill_in 'user[email]', with: Faker::Internet.email
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
  end
  context '都道府県ページ' do
    before do
      @prefecture = FactoryBot.create(:prefecture)
      visit prefectures_path
    end
    it '遷移できる' do
      expect(current_path).to eq prefectures_path
    end
    it '表示の確認' do
      expect(page).to have_content '全国の都道府県から探す'
    end
    it '遷移できる' do
      visit prefecture_path(@prefecture)
      expect(current_path).to eq prefecture_path(@prefecture)
    end
  end
  context 'レビュー関連' do
    before do
      visit company_path(company)
    end
    it '遷移できる' do
      expect(current_path).to eq company_path(company)
    end
    it '表示の確認' do
      expect(page).to have_content '件のレビュー'
    end
    it 'レビューの投稿に成功する' do
      visit new_company_post_comment_path(company)
      fill_in 'post_comment[comment]', with:  Faker::Lorem.characters(number:20)
      expect(page).to have_checked_field('男性')
      expect(page).to have_checked_field('正社員')
      find('#rating-value', visible: false).set(1)
      click_button '投稿'
      expect(page).to have_content 'successfully'
    end
  end
  # context 'カレンダー機能' do
  #   before do
  #     visit events_path
  #   end
  #   it '遷移できる' do
  #     expect(current_path).to eq events_path
  #   end
  #   it 'タイトルフォームの表示' do
  #     expect(page).to have_field 'event[title]'
  #   end
  #   it 'コメントフォームの表示' do
  #     expect(page).to have_field 'event[body]'
  #   end
  # end
  # context 'タスク機能' do
  #   before do
  #     visit homes_task_path
  #   end
  #   it '遷移できる' do
  #     expect(current_path).to eq homes_task_path
  #   end
  #   it 'セレクターの確認' do
  #     expect(page).to have_selector '.task-container'
  #   end
  # end
  # context 'メモ機能' do
  #   before do
  #     visit homes_memo_path
  #   end
  #   it '遷移できる' do
  #     expect(current_path).to eq homes_memo_path
  #   end
  #   it 'セレクターの確認' do
  #     expect(page).to have_selector '.memo-container'
  #   end
  # end
  context 'メール機能' do
    before do
     visit new_contact_path
    end
    it '表示の確認' do
      expect(page).to have_content 'お問い合わせフォーム'
    end
    it 'メールを送信できる' do
      fill_in 'contact[title]', with: Faker::Lorem.characters(number:5)
      fill_in 'contact[body]', with: Faker::Lorem.characters(number:20)
      click_button 'Send'
      expect(page).to have_content 'お問い合わせを送信しました。'
    end
  end
end