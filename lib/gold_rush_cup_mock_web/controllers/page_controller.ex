defmodule GoldRushCupMockWeb.PageController do
  use GoldRushCupMockWeb, :controller
  alias GoldRushCupMockWeb.ErrorView

  def get_license(conn, %{"_json" => []}) do
    case Enum.random([200, 502, 503]) do
      200 ->
        json(conn, %{id: 1, digUsed: 0, digAllowed: 3})

      status_code ->
        conn
        |> put_status(status_code)
        |> json("")
    end
  end

  def get_license(conn, wallet) do
    case Enum.random([200, 200, 402, 402, 503]) do
      200 ->
        json(conn, %{id: 1, digUsed: 0, digAllowed: 5})

      status_code ->
        conn
        |> put_status(status_code)
        |> json("")
    end
  end

  def explore(conn, coordinates) do
    case Enum.random([200, 200, 503]) do
      200 ->
        Process.sleep(Enum.random(0..(10 * coordinates["sizeX"])))
        json(conn, %{amount: Enum.random([0, 0, 0, 3, 6, 7]), area: coordinates})

      status_code ->
        conn
        |> put_status(status_code)
        |> json("")
    end
  end

  def dig(conn, coordinates) do
    Process.sleep(Enum.random((10 * coordinates["depth"])..10_000))

    case Enum.random([200, 404, 404]) do
      200 ->
        json(
          conn,
          Enum.map(0..Enum.random([0, 0, 0, 3, 6, 7]), fn _ ->
            "v2.local.9N6_GSPKlf5Fdn5g2pj1X9goDQjZUNYzFPP8BnEbmgfuZQSowuK7076md_V_96jjvrqosjus1TGt" <>
              "4yLil4C77w"
          end)
        )

      status_code ->
        conn
        |> put_status(status_code)
        |> json("")
    end
  end

  def cash(conn, treasure) do
    Process.sleep(Enum.random(0..2_000))
    json(conn, Enum.map(1..Enum.random(1..10), fn _ -> "1" end))
  end

  def balance(conn, treasure_list) do
    balance = Enum.random([0, 0, 0, 0, 1, 2, 3, 4])

    json(conn, %{balance: balance, wallet: Enum.map(1..balance, fn _ -> 1 end)})
  end
end
