module SessionsHelper
  def login(consumer)
    session[:consumer_id] = consumer.id
    @current_consumer = consumer
  end

  def current_consumer
    @current_consumer ||= Consumer.find(session[:consumer_id])
  end

  def logout
    @current_consumer = session[:consumer_id] = nil
  end
end
