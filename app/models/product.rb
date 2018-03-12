class Product < ApplicationRecord
  validates :name, :category_id, presence: true

  belongs_to :category
  has_many :order_items

  VALID_INTERVALS = ['month', 'week', 'day'].freeze

  def self.quantities_sold(start_date, end_date, interval)
    # Returns product_id, product_name, quantity sold per unit time interval
    
    num_days = (end_date - start_date + 1).to_f

    total_time = 
      case interval
      when 'month'
        num_days / (365 / 12)
      when 'week'
        num_days / 7
      when 'day'
        num_days
      end

     products = Product.joins(:order_items)
      .select("products.id, 
               products.name, 
               SUM(order_items.number_purchased) / #{total_time} as quantity"
             )
      .where(order_items: { created_at: start_date..end_date + 1 })
      .group(:id)

      [products, total_time]
  end

  def self.quantities_sold_csv(start_date, end_date, interval, products, total_time)
    attributes = %i[id name quantity]

    CSV.generate(headers: true) do |csv|
      csv << ['start_date', start_date]
      csv << ['end_date', end_date]
      csv << ['interval', interval]
      csv << ["total_#{interval}s", total_time]

      csv << %w[product_id product_name quantity]

      products.each do |product|
        csv << attributes.map { |attr| product.send(attr) }
      end
    end
  end

  def self.quantities_sold_errors(start_date, end_date, interval)
    errors = []

    begin
      start_date = Date.parse(start_date)
    rescue ArgumentError, TypeError
      errors << 'start_date is invalid'
    end

    begin
      end_date = Date.parse(end_date)
    rescue ArgumentError, TypeError
      errors << 'end_date is invalid'
    end

    begin
      errors << 'end date must be later than start date' if end_date < start_date
    rescue
    end

    begin
      unless VALID_INTERVALS.include?(interval = interval.downcase)
        errors << 'interval is invalid'
      end
    rescue NoMethodError
      errors << 'interval is required'
    end

    [start_date, end_date, interval, errors]
  end
end
