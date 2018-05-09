#
#  Created by Boyd Multerer on 10/07/17.
#  Copyright © 2017 Kry10 Industries. All rights reserved.
#

defmodule Scenic.ViewPort.Driver.Supervisor do
  use Supervisor
  alias Scenic.ViewPort.Driver

#  import IEx

  #============================================================================
  # setup the viewport supervisor - get the list of drivers from the config

  def start_link( args ) do
    Supervisor.start_link(__MODULE__, args)
  end

  def init( {root_sup, drivers} ) do
    drivers
    |> Enum.map( fn(driver_config) ->
      {Driver, {root_sup, driver_config}}
    end)
    |> Supervisor.init( strategy: :one_for_one )
  end

end