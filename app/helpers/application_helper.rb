module ApplicationHelper
  def site_name
    "#{Constants::BANG.titleize}, #{Constants::MARRY.titleize}, #{Constants::KILL.titleize}"
  end

  def site_sentence
    "#{Constants::BANG.titleize}, #{Constants::MARRY.titleize}, and #{Constants::KILL.titleize}"
  end
end
