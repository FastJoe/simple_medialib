module MediaTypes
  class Link < ActiveRecord::Base
    include MediaType

    validates_presence_of :url

    def self.get_instance(params)
      if params[:url].present?
        find_by(url: params[:url]) || new(params)
      else
        new(params)
      end
    end
  end
end