class OrganizationMember < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :events, through: :user

  before_create :update_organization_member
  after_destroy :erase_organization_member

  private
  def update_organization_member
    om = self.organization
    om.members += 1
    om.save
  end

  private
  def erase_organization_member
    ome = self.organization
    ome.members -= 1
    ome.save
  end

end
