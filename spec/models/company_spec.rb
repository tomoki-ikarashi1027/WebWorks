require 'rails_helper'

RSpec.describe 'Companyモデルのテスト', type: :model do
  describe "バリデーションのテスト" do
    let!(:company) { FactoryBot.build(:company) }

    context 'company_nameカラム' do
      it "空欄でないこと" do
        company.company_name = ""
        expect(company.valid?).to eq false
      end
    end
    context 'descriptionカラム' do
      it "空欄でないこと" do
        company.description = ""
        expect(company.valid?).to eq false
      end
    end
    context 'phone_numberカラム' do
      it "空欄でないこと" do
        company.phone_number = ""
        expect(company.valid?).to eq false
      end
    end
    context 'idカラム' do
      it "空欄でないこと" do
        company.prefecture_id = ""
        expect(company.valid?).to eq false
      end
    end
  end
  describe "アソシエーションのテスト" do
    context 'PostCommentモデルとの関係' do
      it "1:Nになっている" do
        expect(Company.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'CompanyLanguageTagRelationsモデルとの関係' do
      it "1:Nになっている" do
        expect(Company.reflect_on_association(:company_language_tag_relations).macro).to eq :has_many
      end
    end
    context 'CompanyFrameworkTagRelationsモデルとの関係' do
      it "1:Nになっている" do
        expect(Company.reflect_on_association(:company_framework_tag_relations).macro).to eq :has_many
      end
    end
    context 'LanguageTagsモデルとの関係' do
      it "1:Nになっている" do
        expect(Company.reflect_on_association(:language_tags).macro).to eq :has_many
      end
    end
    context 'FrameworkTagsモデルとの関係' do
      it "1:Nになっている" do
        expect(Company.reflect_on_association(:framework_tags).macro).to eq :has_many
      end
    end
    context 'Prefectureモデルとの関係' do
      it "1:Nになっている" do
        expect(Company.reflect_on_association(:prefecture).macro).to eq :belongs_to
      end
    end
  end
end