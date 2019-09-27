class MutationResult
  def self.call(obj: {}, success: true, errors: [])
    obj.merge(success: success, errors: errors)
  end
end
