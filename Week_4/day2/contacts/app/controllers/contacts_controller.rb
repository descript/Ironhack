class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
  end

  def create
    # Create new Contact from params[:contact]
    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phonenumber => params[:contact][:phonenumber],
      :email => params[:contact][:email],
      :favorite => false)

      if validate(:name,:address) && validate_email(:email) && validate_phone(:phonenumber)
        contact.save
      else
        redirect_to("/contacts")
      end
  end

  def add_favorite
    @thiscontactid = params[:id]
    @contact = Contact.find_by(id: "#{@thiscontactid}")
    @contact[:favorite] = true
  end

  def show
    @thiscontactid = params[:id]
    @contact = Contact.find_by(id: "#{@thiscontactid}")
  end

  def validate(name, address)
    if (name || address) == nil
      redirect_to("/contacts/new")
    else
      true
    end
  end

  def validate_email(email)
    if email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      true
    else
      false
    end
  end

  def validate_phone(phonenumber)
    if phonenumber =~ /^(?:\(?([0-9]{3})\)?[-. ]?)?([0-9]{3})[-. ]?([0-9]{4})$/
      true
    else
      false
    end
  end

end
