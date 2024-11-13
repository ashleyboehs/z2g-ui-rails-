module ApplicationHelper
    def extract_github_project_info(url)
    return nil unless url

    if matches = url.match(%r{github\.com/(?:orgs/)?([^/]+)/projects/(\d+)})
      {
          organization: matches[1],
          project_number: matches[2].to_i
        }
    end
  end

  def extract_workspace_id(url)
    return nil unless url
    parts = url.strip.split('/')
    workspace_part = parts.find { |part| part.match?(/[0-9a-f]{24}/) }
    workspace_part.match(/([0-9a-f]{24})/)[1] if workspace_part
  end
end
