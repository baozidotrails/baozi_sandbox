module UsersHelper

  def site_title(partial)
    unless partial.blank?
      "Baozi 的沙盒模式 | #{partial}"
    else
      "Baozi 的沙盒模式"
    end
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name)
  end
end
