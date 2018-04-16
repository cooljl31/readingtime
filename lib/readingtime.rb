# encoding: utf-8

Dir[File.dirname(__FILE__) + '/readingtime/*.rb'].each do |file|
  require file
end

module Readingtime
  class << self
    attr_accessor :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reading_speed
      configuration.reading_speed
    end

    def hms(secs)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.hms(secs)
    end

    def minutes_in_seconds(words)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.minutes_in_seconds(words)
    end

    def seconds(words)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.seconds(words)
    end

    # TODO: Account for HH:MM:00
    def format_seconds(seconds)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.format_seconds(seconds)
    end

    def format_words(seconds)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.format_words(seconds)
    end

    def format_approx(seconds)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.format_approx(seconds)
    end

    def format_approx_short(seconds)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.format_approx(seconds)
    end

    def format_full(hms)
      calculator = Calculator.new(reading_speed: reading_speed)
      calculator.format_full(hms)
    end
  end
end
