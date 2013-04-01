module ApplicationHelper
  def avatar_url(user)
  	if user
    	gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    	"http://gravatar.com/avatar/#{gravatar_id}.png?s=39"
    end
  end
end
