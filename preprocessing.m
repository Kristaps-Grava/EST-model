% Pre-processing script for the EST Simulink model. This script is invoked
% before the Simulink model starts running (initFcn callback function).

%% Load the supply and demand data

timeUnit   = 's';

supplyFile = "Team37_supply.csv";
supplyUnit = "MW";

% load the supply data
Supply = loadSupplyData(supplyFile, timeUnit, supplyUnit);

demandFile = "Team37_demand.csv";
demandUnit = "MW";

% load the demand data
Demand = loadDemandData(demandFile, timeUnit, demandUnit);

%% Simulation settings

deltat = 1*unit("min");
stopt  = min([Supply.Timeinfo.End, Demand.Timeinfo.End]);

%% System parameters

% transport parameters
distance_to_storage     = 1     *unit("km");
distance_to_Cairo       = 100   *unit("km");
power_line_resistance   = 0.05  *unit("ohm")/unit("km");
power_line_voltage      = 400   *unit("kV");

% injection parameters
eta_heat_exchanger      = 0.98;

% extraction parameters
eta_generator           = 0.98;
eta_turbine             = 0.85;
%eta_carnot is calculated in code

% storage parameters
salt_mass                   = 6000  *unit("t");
salt_hot_mass_min           = 100   *unit("t");
temp_hot_tank               = 800   *unit("K");
temp_cold_tank              = 500   *unit("K");
temp_environment            = 300   *unit("K");
tank_surface_area           = 1000  *unit("m^2");
salt_heat_capacity          = 1500  *unit("J")/(unit("kg")*unit("K"));
heat_transfer_coefficient   = 0.133 *unit("W")/(unit("K")*unit("m^2"));
