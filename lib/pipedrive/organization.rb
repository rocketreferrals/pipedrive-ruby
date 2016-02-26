module Pipedrive
  class Organization < Base

    def persons
      Person.all(get "#{resource_path}/#{id}/persons")
    end

    def deals
      Deal.all(get "#{resource_path}/#{id}/deals")
    end

    def merge_org(opts = {})
      res = put "#{resource_path}/#{opts[:org_id]}/merge", :body => {merge_with_id: id}
      if res.success?
        res['data']
      else
        false
      end
    end

    class << self

      def find_or_create_by_name(name, opts={})
        find_by_name(name).first || create(opts.merge(:name => name))
      end

    end
  end
end
