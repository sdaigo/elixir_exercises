defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{
      nickname: nickname
    }
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%RemoteControlCar{battery_percentage: per}) do
    "Battery at #{per}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0, distance_driven_in_meters: distance} = car) do
    %{car | battery_percentage: 0, distance_driven_in_meters: distance}
  end

  def drive(%RemoteControlCar{battery_percentage: per, distance_driven_in_meters: distance} = car) do
    %{car | battery_percentage: per - 1, distance_driven_in_meters: distance + 20}
  end
end
