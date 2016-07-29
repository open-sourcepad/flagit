module Circleci
  class Processor

    def initialize from_hook=false
      @build_details = nil
      @from_hook = from_hook
    end

    def process project
      existing_proj = Project.find_by(git_url: project[:vcs_url].split("https://")[1]+".git")
      if existing_proj.present?
        create_circleci_stats(existing_proj,project)
      end
    end

    #
    # will only get the most recent build
    # if a record this week exists, update that record
    # else, create that record
    # NOTE: this method does 3 things
    # update stats, update users, update codelimcate scores(if from hook)
    #
    def create_circleci_stats existing_project, project
      # finds the current hash for the build details
      # NOTE: hash coming in from hooks does not have recent build
      @build_details = branch_alias(project,existing_project)
      # update the weekly stats
      Stats::Processor.new(existing_project.id).update_stats(build_status)
      # scrapes for users, if users are blank
      # users are not present if params is coming from a hook
      scrape_users(existing_project, project) unless @from_hook
      # update codeclimate if this is a hook
      update_codeclimate_score(existing_project) if @from_hook
    end

    # updates project users
    # NOTE: do not update is coming from hash, it does not contain that info
    def scrape_users existing_project, project
      if existing_project.git_users.blank? && @build_details[:pusher_logins].present?
        existing_project.update_attribute(:git_users, @build_details[:pusher_logins])
        update_github_usernames(existing_project)
      end
    end

    def update_codeclimate_score existing_project
      Codeclimate::Client.scrape_project(existing_project.cc_id)
    end

    private

    def branch_alias project, existing_project
      @from_hook ? project : project[:branches][existing_project.branch.to_sym]
    end

    def recent_build
      @recent_build ||= @from_hook ? @build_details.with_indifferent_access : @build_details[:recent_builds][0]
    end

    def update_github_usernames existing_project
      @build_details[:pusher_logins].each do |obj|
        GithubUsername.find_or_create_by(name: obj)
        UsersProject.find_or_create_by(project_id: existing_project.id, github_username: obj)
      end
    end

    def build_status
      {
        build_status: recent_build[:outcome] == "success" ? true : false,
      }
    end

  end
end
