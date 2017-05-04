require 'results_calculator'
task :calculate_poll_results => :environment do
  rc = ResultsCalculator.new
  rc.calculate
end
