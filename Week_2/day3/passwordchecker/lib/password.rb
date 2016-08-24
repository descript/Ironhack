class PasswordChecker

  def greater_7?(password)
    password.to_s.split('').size > 7
  end

  def mix_chars?(password)
    (password.count("0-9") > 0) && (password.count("a-z") > 0) && (password.count("A-Z") > 0) && (password.count("?<>',?[]}={!)(*&^%$#`~{}") > 0)
  end

  def domain_incl?(email,password)
    amper_index = email.index("@") #find index number of @
    name = email.slice(0..(amper_index-1)) #slice to just before @
    domain = email.slice((amper_index+1)..-1) #find domain name with .com included
    dot_index = domain.rindex(".") #find index of the last occurring dot
    domain = domain.slice(0..(dot_index-1)) #slice from domain to right before the .com

    password.include?(name) || password.include?(domain) ? false : true #LOGIC
  end

  def check_password(email,password)
    greater_7?(password)
    mix_chars?(password)
    domain_incl?(email,password)
  end

end
