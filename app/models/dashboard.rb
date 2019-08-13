class Dashboard < ApplicationRecord
  belongs_to :user
  include RailsSortable::Model
  set_sortable :sort

  DUMMY_CHART_DATA = [["some",5], ["dummy", 11], ["chart", 12]]
  validates :title, length: {minimum: 3, maximum: 15},  allow_blank: false
  validates :body,  length: {minimum: 5, maximum: 200}, allow_blank: false
end
