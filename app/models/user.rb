class User < ActiveRecord::Base
    has_secure_password
    
    has_many :track
    
    def admin? 
        self.role == 'admin' 
    end
    
end
