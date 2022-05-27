require 'securerandom'

class GlobalMethod
    def generateStringKey
        @key = SecureRandom.alphanumeric
    end
    
end