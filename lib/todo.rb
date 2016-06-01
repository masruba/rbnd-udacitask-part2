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

  def details_table_format
    table_data = {:description => @description}
    table_data[:due] = @due if @due
    table_data[:priority] = @priority if @priority
    Formatador.display_table([table_data])
  end  

  # Feature 3 : Increase the level of Priority
  def upgrade_priority
    priority_list = ['low', 'medium', 'high']    
    index = priority_list.index(@priority)

    # if no priority level is set
    if index == nil
      @priority = priority_list[0]
    elsif index == priority_list.length - 1
      puts "The priority is already set to highest!"
    else
    # Increase the priority level
      @priority = priority_list[index + 1]
    end    
  end

  # Feature 3 : Decrease level of Priority
  def downgrade_priority
    priority_list = ['low', 'medium', 'high']    
    index = priority_list.index(@priority)

    # if no priority level is set
    if index == nil
      @priority = priority_list[0];
    elsif index == 0
      puts "The priority is already set to lowest!"
    else 
      # Increase the priority level
      @priority = priority_list[index - 1];
    end    
  end
end
