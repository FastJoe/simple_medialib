module MediaType
  extend ActiveSupport::Concern
  included do
    has_many :media, as: :resource, dependent: :destroy
  end

  module ClassMethods
    def get_instance(params)
      new(params)
    end
  end
end