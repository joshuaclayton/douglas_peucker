# Douglas-Peucker Algorithm

This algorithm simplifies a line by recursively dividing a line and removing points outside of a predefined threshold. Check out the [Wikipedia page](http://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm) to read up on it more.

## Usage

    >> require "douglas_peucker"
    => true
    >> line = [[0, 0], [1, 1], [2, 1], [3, 2.5], [4, 4]]
    => [[0, 0], [1, 1], [2, 1], [3, 2.5], [4, 4]]
    >> DouglasPeucker::LineSimplifier.new(line).threshold(1).points
    => [[0, 0], [4, 4]]
    >> DouglasPeucker::LineSimplifier.new(line).threshold(0.5).points
    => [[0, 0], [2, 1], [4, 4]]
    >> DouglasPeucker::LineSimplifier.new(line).points
    => [[0, 0], [1, 1], [2, 1], [4, 4]]

## License

See the LICENSE

## Author

Written by Josh Clayton, although the algorithm and its various implementations have been written before.
