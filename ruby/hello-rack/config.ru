require 'rack'
require 'rack/handler/puma'
require 'oj'

class Stats

  def initialize
    @stats = {}
    @lock = Mutex.new
  end

  def fetch(key, default=nil)
    @lock.synchronize do
      @stats.fetch(key, default)
    end
  end

  def store(key, value)
    @lock.synchronize do
      @stats.store(key, value)
    end
  end

  def dump(options=nil)
    @lock.synchronize do
      Oj.dump(@stats)
    end
  end
end

$metrics = Stats.new

$done = false
agent_thread = Thread.new do
  while true
    $metrics.store(:time, Time.now.to_i)
    $metrics.store(:count, $metrics.fetch(:count, 0) + 1)
    Thread.pass
  end
end

@app = Proc.new do |env|
  case env.fetch('PATH_INFO')
  when '/stats'
    ['200', {'Content-Type' => 'text/html'}, [$metrics.dump]]
  else
    ['404', {'Content-Type' => 'text/html'}, ['Not Found']]
  end
end

Rack::Handler::Puma.run @app
raise SignalException, 'SIGINT'
agent_thread.join
