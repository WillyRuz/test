require 'date'

def date_iterator(first_date, second_date, day_number)  
  first_date_change = Date.parse(first_date)
  second_date_change = Date.parse(second_date)
  dates = []
  month = first_date_change.mon
  year = first_date_change.year
  month_end = second_date_change.mon
  
  while month <= month_end do 
    dates.push(Date.new(year, month, day_number).to_s)
    month += 1
  end
  
  dates
end

date_iterator('2018-01-02', '2018-05-05', 4)
