class FeedbackMailer < ActionMailer::Base
  default :from => "noreply@astellasoncology.co.uk"
  default :to => "branden.mittra@streamingwell.com"

  def new_feedback(feedback)
    @feedback = feedback
    mail(:subject => "Evaluation: Prostate Cancer Lunchtime Webinar")
  end

end