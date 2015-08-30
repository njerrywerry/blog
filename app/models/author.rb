class Author < ActiveRecord::Base
  authenticates_with_sorcery!
end
