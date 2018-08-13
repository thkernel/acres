class ConfigOption < ApplicationRecord
    validates_presence_of :app_name
end
