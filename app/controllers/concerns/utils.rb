=begin
module Utils
    include ActiveSupport::Concern
    
    def extract_numeric(string)
        string.scan(/\d/).join
    end
end
=end