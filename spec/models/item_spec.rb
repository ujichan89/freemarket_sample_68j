validates_associated :images
validates :name,  presence: true, length: {maximum: 40}
validates :description,  presence: true , length: {maximum: 1000}
validat