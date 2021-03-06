module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = @site_title
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def path_exists?(path)

    if path.class == String
      begin
        Rails.application.routes.recognize_path(path)
      rescue
        return false
      end
    else
      begin
        polymorphic_path(path)
      rescue
        return false
      end
    end
    true
  end
end
