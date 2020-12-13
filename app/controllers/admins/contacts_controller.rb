class Admins::ContactsController < ApplicationController
  def top
  end

  def index
    @contacts = Contact.page(params[:page]).order(created_at: :desc).per(10)
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contacts_params)
      flash[:notice] = '返信できました'
      user = @contact.user
      ContactMailer.send_when_admin_reply(user, @contact).deliver_now
      redirect_to admins_contacts_path
    else
      render :edit
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      redirect_to admins_contacts_path
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(:title, :body, :reply)
  end
end
