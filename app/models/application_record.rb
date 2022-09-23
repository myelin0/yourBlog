class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end


class Post < ApplicationRecord

end

class Comment < ApplicationRecord
belongs_to:Post , foreign_key: true
belongs_to:User , foreign_key: true
end

class Like < ApplicationRecord
belongs_to:Post , foreign_key: true
belongs_to:User , foreign_key: true
end