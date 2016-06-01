class LinkItem
  include Listable
  attr_reader :description, :site_name

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name ? @site_name : ""
  end

  def details
    format_description(@description) + "site name: " + format_name
  end

  def details_table_format
    table_data = {:description => @description}
    table_data[:due] = @due if @due
    table_data[:site_name] = @site_name if @site_name
    Formatador.display_table([table_data])
  end  

end
