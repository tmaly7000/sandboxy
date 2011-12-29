class Link < ActiveRecord::Base
  attr_accessible :id, :title, :url, :description
  validates_presence_of :title, :url

  has_and_belongs_to_many :link_groups, :uniq => true, :join_table => :grouped_links

  scope :simple_list, select("id, usr_name, api_key, is_active, created_at")
end
