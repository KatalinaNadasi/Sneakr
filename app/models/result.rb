class Result < ActiveRecord::Base
  belongs_to :shoe
  belongs_to :store
end
