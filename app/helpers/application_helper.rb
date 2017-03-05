module ApplicationHelper
  def get_name(email)
    name = email[/[^@]+/]
    name.split(".").map {|n| n.capitalize }.join(" ")
  end
end
