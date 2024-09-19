class ApplicationService
  def self.call(*args)
    # will create a new instance of the self class and call 'call' method on it
    new(*args).call
  end
end