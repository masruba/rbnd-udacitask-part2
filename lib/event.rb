class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(description, options={})
    @description = description
    @start_date = Date.parse(Chronic.parse(options[:start_date]).to_s) if options[:start_date]
    @end_date = Date.parse(Chronic.parse(options[:end_date]).to_s) if options[:end_date]
  end

  def details
    type = get_item_type
    puts '*'*type.length
    puts type
    puts '*'*type.length    
    format_description(description) + "event dates: " + format_date(start_date: @start_date, end_date: @end_date)
  end

  def details_table_format
    table_data = {:description => @description}
    table_data[:item_type] = get_item_type
    table_data[:start_date] = @start_date if @start_date
    table_data[:end_date] = @end_date if @end_date
    Formatador.display_table([table_data])
  end  
end
