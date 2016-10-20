module ApplicationHelper

  def is_active(param)
    return "active" if controller.controller_name == param
  end

end
