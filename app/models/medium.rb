class Medium < ActiveRecord::Base
  belongs_to :resource, polymorphic: true
  belongs_to :user
  accepts_nested_attributes_for :resource
  after_destroy :destroy_resource

  validates_presence_of :name

  private

  def destroy_resource
    resource.destroy if resource.media.length == 0
  end

end
