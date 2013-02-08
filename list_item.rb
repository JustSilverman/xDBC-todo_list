class ListItem
 attr_reader :id, :task, :status

  def initialize(args)
    @id      = args[:id]
    @task    = args[:task]
    @status  = args[:status]
  end
end
