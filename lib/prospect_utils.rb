module ProspectUtils
  def self.draft_eligible?(dob, draft_date, is_north_american = true)
    draft_age = age(dob, draft_date)

    return false if draft_age < 18
    return false if draft_age > 20 && is_north_american

    true
  end

  def self.age(dob, date)
    date.year - dob.year - ((date.month > dob.month || (date.month == dob.month && date.day >= dob.day)) ? 0 : 1)
  end
end
