require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe User do
    it '有効なファクトリを持つこと' do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  before do
    @user = FactoryBot.build(:user)
  end
  it '値が全て適切' do
    expect(@user.valid?).to eq(true)
  end
  describe 'User登録時のテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = nil
        is_expected.to eq false
      end
    end
    context 'emailカラム' do
      let(:test_user) {user}
      it '空欄でないこと' do
        test_user.email = nil
        is_expected.to eq false
      end
      it '重複したメールアドレスなら無効であること' do
        create(:user, email:  "test@example.com")
        user = build(:user, email: "test@example.com")
        user.valid?
        expect(user.errors[:email]).to include("はすでに存在します")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Contactモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:contacts).macro).to eq :has_many
      end
    end
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:events).macro).to eq :has_many
      end
    end
    context 'Taskモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:tasks).macro).to eq :has_many
      end
    end
    context 'Memoモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:memos).macro).to eq :has_many
      end
    end
  end
end