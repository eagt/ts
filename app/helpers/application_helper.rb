
module ApplicationHelper

  # Returns the full title on a per-page basis. 
  # The full_titleIt is used in case the (provide (:title, XX) ) is deleted by mistake as has been done at the home page
  # for example at the top of (Home) viwe page there was  <% provide(:title, "Home") %>
  # in this way the page title tap was shown Ts|home as is shown in the other pages.

     # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title = '')                     # Method def, optional arg
    base_title = "Ts App"  								                # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end
end
