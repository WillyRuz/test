class SumRowColumn
    @rows = []
    @columns = []
    @numbers = [
      [6, 7, 8],
      [1, 4, 29],
      [4, 78, 12]
    ]
  def self.sum_row
    @numbers.each do |row|
      @rows.push(row.sum)
    end
    puts @rows.max
  end
  def self.sum_column
    @numbers.transpose.each do |columns|
      @columns.push (columns.sum)
    end
    puts @columns.max
  end
end

SumRowColumn.sum_row
SumRowColumn.sum_column