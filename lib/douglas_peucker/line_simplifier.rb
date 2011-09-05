module DouglasPeucker
  class LineSimplifier

    def initialize(points)
      @points = points
      @threshold = 10e-8
    end

    def threshold(threshold)
      @threshold = threshold
      self
    end

    def points
      calculate_points(@points)
    end

    private

    def orthogonal_distance(point, line_start, line_end)
      line  = Line.new(Point.new(line_start[0], line_start[1]), Point.new(line_end[0], line_end[1]))
      point = Point.new(point[0], point[1])
      OrthogonalDistance.new(point, line).distance
    end

    def calculate_points(points)
      return points if points.length < 3

      maximum_distance = 0
      index = 0

      (1..(points.length - 1)).each do |i|
        current_distance = orthogonal_distance(points[i], points.first, points.last)
        if current_distance > maximum_distance
          index = i
          maximum_distance = current_distance
        end
      end

      if maximum_distance >= @threshold
        results_1 = calculate_points(points[0..index])
        results_2 = calculate_points(points[index..-1])

        results_1[0..-2] + results_2
      else
        [points.first, points.last]
      end
    end
  end
end
