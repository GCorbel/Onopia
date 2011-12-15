module HtmlSelectorsHelper
  def selector_for(scope)
    case scope
    when /the body/
      "html > body"
    else
      raise "Can't find mapping from \"#{scope}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelper)
