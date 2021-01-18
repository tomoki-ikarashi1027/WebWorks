require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject {page}
      it 'タイトルの表示' do
        is_expected.to have_content 'Web'
        is_expected.to have_content 'Works'
      end
      it 'Log inリンクの表示' do
        is_expected.to have_content 'Log in'
      end
      it 'Adminsリンクの表示' do
        is_expected.to have_content 'Admins'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it 'Log inリンクから遷移' do
        visit new_user_session_path
        expect(current_path).to eq new_user_session_path
      end
      it 'Adminsリンクから遷移' do
        visit new_admin_session_path
        expect(current_path).to eq new_admin_session_path
      end
    end
  end
  describe 'ログインしている場合' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
    context 'ヘッダーの表示を確認' do
      subject {page}
      it 'Homeリンクの表示' do
        is_expected.to have_content 'Home'
      end
      it 'Log outリンクの表示' do
        is_expected.to have_content 'Log out'
      end
      it 'Contactリンク表示' do
        is_expected.to have_content 'Contact'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it 'Homeリンクから遷移' do
        visit  root_path
        expect(current_path).to eq root_path
      end
      it 'Contactリンクから遷移' do
        visit new_contact_path
        expect(current_path).to eq new_contact_path
      end
    end
  end
  describe '管理者でログインした場合' do
    before do
      visit new_admin_registration_path
      fill_in 'admin[email]', with: Faker::Internet.email
      fill_in 'admin[password]', with: 'password'
      fill_in 'admin[password_confirmation]', with: 'password'
      click_button 'Sign up'
    end
    context 'ヘッダーの表示を確認' do
      subject {page}
      it 'Admins Homeリンクの表示' do
        is_expected.to have_content 'Admins Home'
      end
      it 'Users Homeリンクの表示' do
        is_expected.to have_content 'Users Home'
      end
      it 'Log outリンク表示' do
        is_expected.to have_content 'Log out'
      end
    end
    context 'ヘッダーのリンクを確認' do
      it 'Admins Homeリンクから遷移' do
        visit admins_contacts_top_path
        expect(current_path).to eq admins_contacts_top_path
      end
      it 'Users Homeリンクから遷移' do
        visit root_path
        expect(current_path).to eq root_path
      end
    end
  end
end