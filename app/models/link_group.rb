class LinkGroup < ActiveRecord::Base
  has_and_belongs_to_many :links, :uniq => true, :join_table => :grouped_links
end
