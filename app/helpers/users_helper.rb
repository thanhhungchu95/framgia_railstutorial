module UsersHelper
  def gravatar_for user, size: Settings.user.helper.gravatar.size
    gravatar_id = Digest::MD5::hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end

  def microposts_for user
    Micropost.where(user_id: user.id).select(:id, :content, :user_id, :created_at)
      .sort_by_post_time.page(params[:page]).per Settings.user.helper.post_per_page
  end
end
