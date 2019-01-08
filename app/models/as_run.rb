class AsRun < ApplicationRecord

  belongs_to :user
  has_many :logs

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the file's name is present.
  validates :attachment, presence: true
end

