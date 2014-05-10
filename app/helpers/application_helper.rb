module ApplicationHelper
  def bootstrap_flash_class(name)
    case name.to_s
    when 'notice'
      'info'
    when 'error'
      'danger'
    else
      name.to_s
    end
  end
end
