class AnsuzMailer < ActionMailer::Base
  def page_review_notifications(page, sent_at = Time.now)
    subject    "[#{page}] has been submitted for review."
    recipients User.content_approvers.map(&:email)
    from       OUTGOING_ADMIN_EMAIL
    sent_on    sent_at
    
    body       :url  => edit_admin_page_url(page), :page => page
  end

  def page_publication_notifications(page, sent_at = Time.now)
    subject    "[#{page}] has been approved."
    recipients User.authors.map(&:email)
    from       OUTGOING_ADMIN_EMAIL
    sent_on    sent_at
    
    body       :page => page, :url => url_for(:controller => "page", :action => "indexer", :path => page.path.collect(&:name))
  end

  def page_expiring_soon_notification(page, sent_at = Time.now)
    subject    "[#{page}] will expire soon."
    recipients User.authors.map(&:email)
    from       OUTGOING_ADMIN_EMAIL
    sent_on    sent_at
    body       :page => page, :url => url_for(:controller => "page", :action => "indexer", :path => page.path.collect(&:name))
  end
end

