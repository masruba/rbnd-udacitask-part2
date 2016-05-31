module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(30)
  end

  def format_date(options={})
  	if options.key?(:start_date)
	  	start_data = options[:start_date]
	  	end_date = options[:end_date]
	    dates = @start_date.strftime("%D") if start_date
	    dates << " -- " + @end_date.strftime("%D") if end_date
	    dates = "N/A" if !dates
	    return dates
	  else
	  	due =  options[:due]
	    due ? due.strftime("%D") : "No due date"
	  end
  end  

  def format_priority(value)
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end

end
