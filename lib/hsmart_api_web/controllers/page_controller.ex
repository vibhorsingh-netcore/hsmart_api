defmodule HsmartApiWeb.PageController do
  use HsmartApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, %{"ref_id" => ref_id} = _params) do
    #headers = ["Content-Type": "application/json"]
    response = HTTPotion.get("http://localhost:8984/solr/dlr_response_data/select?q=ref_id:#{ref_id}&fl=ref_id,created_time&omitHeader=true&indent=false")
    #data = Poison.decode!(response.body)
    #IO.inspect response.body
    #IO.inspect data.response
    if (String.strip(ref_id) != "") do
      conn
      |> json(Poison.decode!(response.body))
    else
    conn
      |> put_status(400)
      |> text("Invalid or empty ref id")
    end
  end

  def search(conn, _params) do
    conn
    |> put_status(400)
    |> text("Invalid or empty ref id")
  end
end
