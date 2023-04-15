module ProspectUtils
  def self.draft_eligible?(dob, date = draft_date)
    draft_age = age(dob, date)

    return false if draft_age < 18
    return false if draft_age > 20

    true
  end

  def self.draft_date(year = nil)
    date = Date.new

    return Date.new(year, 9, 15)      if year
    return Date.new(date.year, 9, 15) if date <= Date.new(date.year, 9, 15)
    
    Date.new(date.year + 1, 9, 15)
  end

  def self.age(dob, date)
    date.year - dob.year - ((date.month > dob.month || (date.month == dob.month && date.day >= dob.day)) ? 0 : 1)
  end
end
