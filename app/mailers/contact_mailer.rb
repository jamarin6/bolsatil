class ContactMailer < ActionMailer::Base
  default from: "contact@kotraders.com"


  def contact_mail(mail, nombre, message)
  	@nombre = nombre
	@message = message

  	mail(to: 'jamarinhidalgo@gmail.com', subject: 'Contacto en Kotraders')
  end
end
