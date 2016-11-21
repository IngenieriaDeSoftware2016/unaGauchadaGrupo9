class Usuario < ActiveRecord::Base
  has_attached_file :avatar,
   storage: :dropbox,
   dropbox_credentials: Rails.root.join("config/dropbox.yml"),
   dropbox_options: {
     environment: ENV["RACK_ENV"],
     path: proc{|style| "#{style}/#{id}_#{avatar.original_filename}"}
   }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :gauchadas, dependent: :destroy
  has_many :compras
  has_many :postulantes
  has_one :imagens
end
