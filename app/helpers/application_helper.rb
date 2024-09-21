module ApplicationHelper
    def flash_class(type)
        case type.to_sym
        when :notice
          "alert-success" # Bootstrap class for success
        when :alert
          "alert-danger" # Bootstrap class for error
        else
          "alert-info" # Fallback class
        end
      end
end
