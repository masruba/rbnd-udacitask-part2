class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    if options[:priority]
      if ['high', 'medium', 'low'].include? options[:priority] 
        @priority = options[:priority]
      else
        raise UdaciListErrors::InvalidPriorityValue, "Priority value is invalid!"
      end
    end
    @description = description
    @due = options[:due]
    if @due
      parse_time = Chronic.parse(options[:due])
      @due = Date.parse(parse_time.to_s)
    end
    
  end

  def details
    format_description(@description) + "due: " +
    format_date(due: due) +
    format_priority(@priority)
  end
end
