# coding: utf-8

module TTY
  class ProgressBar
    class Formatter
      extend Forwardable

      def_delegators :@pipeline, :decorate, :use

      # @api private
      def initialize(pipeline = nil)
        @pipeline = TTY::ProgressBar::Pipeline.new
      end

      # Prepare default pipeline formatters
      #
      # @api private
      def load
        @pipeline.use TTY::ProgressBar::CurrentFormatter
        @pipeline.use TTY::ProgressBar::TotalFormatter
        @pipeline.use TTY::ProgressBar::ElapsedFormatter
        @pipeline.use TTY::ProgressBar::EstimatedFormatter
        @pipeline.use TTY::ProgressBar::PercentFormatter
        @pipeline.use TTY::ProgressBar::ByteFormatter
        @pipeline.use TTY::ProgressBar::BarFormatter
      end
    end # Formatter
  end # ProgressBar
end # TTY
