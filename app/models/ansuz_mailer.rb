class AnsuzMailer < ActionMailer::Base
  def page_review_notifications(page, sent_at = Time.now)
    subject    'Ansuz#page_review_notifications'
    recipients 'knewter@gmail.com'
    from       'knewter@gmail.com'
    sent_on    sent_at
    
    body       :url => edit_admin_page_url(page)
  end

end
