class Album < ActiveRecord::Base
    has_many :track
end
