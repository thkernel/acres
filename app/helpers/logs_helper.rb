module LogsHelper
    def status?(log)
        if log.status = true
            true 
        else
            false
        end
    end
end
