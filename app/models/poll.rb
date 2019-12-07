class Poll < ApplicationRecord
  has_many :advisings
  has_many :candidates, through: :advisings
  has_many :peers, through: :advisings
 
  validate :start_date_cannot_be_in_the_past, on: :create
  validate :end_date_cannot_be_before_start_date
  validates :start_date, :end_date, presence: true

  validates_presence_of(:peerage_type)
  enum peerage_type: Peer.orders

  def self.where_order(peerage)
    Poll.where(peerage_type: peerage)
  end
  def self.current(peerage)
    Poll.where(peerage_type: peerage).each do |p|
     return p if p.active?
    end    
    return nil
  end

  def self.last_published_for(peerage)
    Poll.where(peerage_type: peerage).where(published: true).where('end_date <=?', Date.today).order(:end_date).last 
  end
  def self.last_for(peerage) 
    Poll.where(peerage_type: peerage).last    
  end
  def self.active_for(peerage)
    Poll.where(peerage_type: peerage).find{ |p| p.active? }
  end

  def self.future_for(peerage)
    Poll.where(peerage_type: peerage).find{ |p| p.future? }
  end

  def start_date_cannot_be_in_the_past
    if !start_date.nil? and start_date < Date.today.to_datetime
        errors.add(:start_date, 'start_date cannot be in the past')
    end
  end
  def end_date_cannot_be_before_start_date
    unless end_date.nil? || start_date.nil?
      if end_date < start_date
        errors.add(:end_date, 'end_date cannot be before start_date')
      end
    end
  end

  def active? 
    self.start_date.past? && self.end_date.future? 
  end

  def future?
    start_date.future? && end_date.future?
  end
  def past?
    start_date.past? && end_date.past?
  end
end
