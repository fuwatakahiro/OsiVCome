class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  # 確認画面
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻る
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 実際に送信するアクションになります。
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      notification = Notification.new
      notification.contact_id =@contact.id
      notification.checked = false
      notification.save
      flash[:notice] = "お問合せを送りました"
      redirect_to done_path(contact: @contact)
    else
      render :new
    end
  end
  # 送信完了画面
  def done
    @contact = Contact.find(params[:contact])
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:message)
  end
  def notification_params
    params.require(:notification).permit(:contact_id, :checked)
  end
end