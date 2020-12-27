class ContactsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about, :memo]
  def top
  end

  def about
  end

  def memo

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.user_id = current_user.id
    if @contact.save
      flash[:notice] = 'お問い合わせを送信しました。'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:title, :body, :reply)
  end
end