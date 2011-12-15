class ApiUser < ActiveRecord::Base

  attr_accessible :usr_name, :enc_pswd, :api_key, :is_active, :created_at

  validates_presence_of :usr_name, :enc_pswd

  scope :simple_list, select("usr_name, api_key, is_active, created_at")
end
