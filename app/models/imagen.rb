class Imagen < ActiveRecord::Base
#added for paperclip-drop gem
has_attached_file :picture,
 :storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
 :styles => { :medium => "300x300" , :thumb => "100x100>"},
:dropbox_options => {
:path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       :unique_filename => true
  }


validates :picture, :attachment_presence => true
belongs_to :usuario
belongs_to :gauchada
end
