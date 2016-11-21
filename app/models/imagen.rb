class Imagen < ActiveRecord::Base
  attr_accessible :picture, :verified, :usuario_id, :gauchada_id
#added for paperclip-drop gem
has_attached_file :picture,
 :storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_c
onfig.yml",
 :styles => { :medium => "300x300" , :thumb => "100x100>"},
:dropbox_options => {
:path => proc { |style| "#{style}/#{id}_#{picture.original_filename}"},       :unique_filename => true
  }


validates :picture, :attachment_presence => true
belongs_to :usuario
belongs_to :gauchada
end
