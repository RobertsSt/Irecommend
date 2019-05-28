module ApplicationHelper
  def profile_avatar_select64(user)
    return image_tag user.avatar.url(:original),
                     id: 'image-preview',
                     style: 'width: 64px;height: 64px;',
                     class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'default-avatar.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end

  def profile_avatar_select264(user)
    return image_tag user.avatar.url(:original),
                     id: 'image-preview',
                     style: 'width: 264px;height: 264px; margin-left: auto;margin-right: auto;',
                     class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'default-avatar.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end

  def profile_avatar_select32(user)
    return image_tag user.avatar.url(:original),
                     id: 'image-preview',
                     style: 'width: 32px;height: 32px;',
                     class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'default-avatar.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end
end
