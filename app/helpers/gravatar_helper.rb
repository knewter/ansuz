# Shamelessly taken from Typo (http://www.typosphere.org)

module GravatarHelper
  # Generate the image tag for a commenters gravatar based on their email address
  # Valid options are described at http://www.gravatar.com/implement.php
  def gravatar_tag(email, options={})
    options.update(:gravatar_id => Digest::MD5.hexdigest(email.strip))
    options[:default] = CGI::escape(options[:default]) if options.include?(:default)
    options[:size] ||= 60

    image_tag("http://www.gravatar.com/avatar.php?" <<
      options.map { |key,value| "#{key}=#{value}" }.sort.join("&"), :class => "gravatar")
  end
end
