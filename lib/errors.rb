module UdaciListErrors
  # Error classes go here
  class InvalidItemType < StandardError
  end
  class IndexExceedsListSize < StandardError
  end
  class InvalidPriorityValue < StandardError
  end
  # Feature 2: Invalid Index Error Class
  class InvalidIndex < StandardError
  end
end
