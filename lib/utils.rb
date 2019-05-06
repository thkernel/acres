module SharedUtils
    module Utils
        def extract_numeric(string)
            string.scan(/\d/).join
        end
    end
end