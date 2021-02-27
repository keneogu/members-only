module PostsHelper
  def edit_profile_sign_in
    if user_signed_in?
      link_to 'Edit profile', edit_user_registration_path
    else
      link_to 'Sign In', new_user_session_path
    end
  end

  def sign_out_sign_up
    if user_signed_in?
      link_to 'Sign Out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign Up', new_user_registration_path
    end
  end

  def user_name_th
    'Name' if user_signed_in?
  end

  def user_name_td(post)
    post.user.name if user_signed_in?
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def index_links(post, job)
    if user_signed_in? && job == 'edit'
      link_to 'Edit', edit_post_path(post)
    elsif user_signed_in? && job == 'destroy'
      link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' }
    elsif !user_signed_in? && job == 'show'
      link_to 'Show', post
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  def new_post_link
    link_to 'New Post', new_post_path if user_signed_in?
  end

  def show_name
    @post.user.name if user_signed_in?
  end
end
