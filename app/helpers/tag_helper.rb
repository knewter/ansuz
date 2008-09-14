module TagHelper
  def link_to_tagged_item tagged_item
    case tagged_item
    when Ansuz::JAdams::BlogPost
      link_to tagged_item, admin_blog_post_path(tagged_item)
    end
  end
end
