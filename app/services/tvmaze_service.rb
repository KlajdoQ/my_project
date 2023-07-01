class TVmazeService
    include HTTParty
    base_uri 'https://api.tvmaze.com'
  
    def search_show(query)
      response = self.class.get("/search/shows", query: { q: query })
      response.parsed_response
    end
  
    def get_show_details(show_id)
      response = self.class.get("/shows/#{show_id}")
      response.parsed_response
    end
  end
  