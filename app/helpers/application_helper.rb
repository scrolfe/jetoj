module ApplicationHelper

def youtube_frame(url)
  content_tag(:iframe, '', src: url, width: 560, height: 349, frameborder: 0)
end

end
