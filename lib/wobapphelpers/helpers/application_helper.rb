module ApplicationHelper
  def icon(what)
    raw(%Q[<span class="glyphicon glyphicon-#{what}"></span>])
  end
end
