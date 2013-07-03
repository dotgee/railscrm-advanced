class Api::V1::ContactsController < Api::V1::BaseController
  def index
    @contacts = Contact.all
    respond_with @contacts
  end

  def create
    respond_with Contact.create!(params.permit(:first_name, :last_name, :phone, :company, :email, :address, :city, :zip, :country))
  end

  def destroy
    Contact.destroy(params[:id])
    head :ok
  end
end
