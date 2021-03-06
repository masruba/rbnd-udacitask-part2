module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def get_item_type
    type = "Event" if self.class == EventItem
    type = "To-Do" if self.class == TodoItem
    type = "Link" if self.class == LinkItem
    type
  end

  def parse_date(input_date)
    input_date.strftime("%D") if input_date
  end

  def format_date(options={})
  	if options.key?(:start_date)
	  	dates = parse_date(options[:start_date])
      end_date = parse_date(options[:end_date])
	  	dates << " -- " + end_date if end_date
	    dates = "N/A" if !dates
	    return dates
	  else
	  	due =  options[:due]
	    due ? due.strftime("%D") : "No due date"
	  end
  end  

  def format_priority(value)
    value = " ⇧".colorize(:red) if @priority == "high"
    value = " ⇨".colorize(:yellow) if @priority == "medium"
    value = " ⇩".colorize(:blue) if @priority == "low"
    value = "" if !priority
    return value
  end

end
