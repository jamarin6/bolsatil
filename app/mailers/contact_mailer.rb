class ContactMailer < ActionMailer::Base
  default from: "from@example.com"


  def contact_mail(mail, nombre, message)
  	@nombre = nombre
	@message = message

  	mail(to: 'jamarinhidalgoi@gmail.com', subject: 'Contacto en Kotraders')
  end
end
