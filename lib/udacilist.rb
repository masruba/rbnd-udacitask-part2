class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    options[:title] ? @title = options[:title] :  @title = "Untitled List"   
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    if ['todo', 'event', 'link'].include? type
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    else
        raise UdaciListErrors::InvalidItemType, "Item type is invalid!"
    end      
  end

  def filter(type)    
    if ['todo', 'event', 'link'].include? type
      filter_objects = @items.find_all {|object| object.is_a?(TodoItem)} if type == "todo"
      filter_objects = @items.find_all {|object| object.is_a?(EventItem)} if type == "event" 
      filter_objects = @items.find_all {|object| object.is_a?(LinkItem)}  if type == "link"      
      filter_objects.each do |item|
        puts item.details
      end
    else
      puts "Invalid Item Type!"
    end
  end

  def delete(index)
    raise UdaciListErrors::InvaidIndex, "Invalid Index" if index < 0
    index > @items.length ? (raise UdaciListErrors::IndexExceedsListSize, "{Index #{index} exceeds the list length #{@items.length}") : @items.delete_at(index - 1)
  end

  # Feature 1: Allow deletion of multiple items
  def delete_multiple(incides)
    indices.each do|index| 
      delete(index)
    end
  end

  def all
    puts "-" * (@title.length*4.5)
    a = Artii::Base.new
    puts a.asciify(@title) 
    puts "-" * (@title.length*4.5)
    @items.each_with_index do |item, position|
      #puts "#{position + 1}) #{item.details}"
      puts item.details_table_format
    end
  end
end
