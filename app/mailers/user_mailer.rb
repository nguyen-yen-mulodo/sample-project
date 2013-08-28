class UserMailer < ActionMailer::Base
  default :from => "yenkhtn@gmail.com"   # Enter your email username here
   
    def sending                                      # we use mail as parameter because we create scaffold as Mail eairlier
   
     mail(:to => "nguyen.yen@mulodo.com", :subject => "mail.subject", :body =>" mail.body") 
   
    end  
end
