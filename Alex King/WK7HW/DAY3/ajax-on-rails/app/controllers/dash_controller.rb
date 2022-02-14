class DashController < ApplicationController

  # This just loads the SPA template from
  # app.html.erb, including all the JS that does the rest of the work
  # (like making AJAX requests to other Rails routes)
  def app
  end

  # AJAX API actions

  def uptime
    # This action will be reached via an axios.get() AJAX request
    # from the browser, which means it should return JSON and
    # not HTML markup

    @uptime_output = `uptime`

    data = {
      command: 'uptime',
      output: @uptime_output,
      random_numbers: [1234,23,42]
    }

    # The same controller action can respond with either
    # HTML or JSON data, depending on the request format.
    # The browser specifies this format as a request header,
    # (i.e. axios is doing this for us as type )
    #   Accept: application/json    - for AJAX requests
    #   Accept: text/html           - for regular page

    # render json: data

    respond_to do |format|
      format.html # do the default thing of rendering uptime.html.erb 
      format.json { render json: data }
    end

  end

  def cpu_hog
    @hog = `ps xr`.split("\n").second
    render json: { hog: @hog }
  end


end
