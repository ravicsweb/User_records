class Record < ActiveRecord::Base  

  attr_accessible :fname,:lname, :email,:cell_no,:address,:city,:gender,:bdate,:hobbies ,:avatar
  validates :fname,  :presence => true,
                    :length   => { :maximum => 20 }
  validates :lname,  :presence => true,
                    :length   => { :maximum => 20 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
                  
  validates :hobbies,  :presence => true
  
  validates_format_of :bdate,
                      :with => /\A(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\/\d{4}\Z/,
                      :allow_blank => true,
                      :allow_nil => true
                    
   has_attached_file :avatar#, styles: {height: '200x200'}

  #validates_attachment :avatar, :content_type => { :content_type => "image/jpg" }

end
