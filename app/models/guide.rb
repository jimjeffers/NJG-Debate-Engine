class Guide < Product
  has_many :images, :as => :attachable, :dependent => :destroy
end
