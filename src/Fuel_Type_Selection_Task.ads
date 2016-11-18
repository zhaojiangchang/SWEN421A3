pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with PUMP;
with PUMP_UNIT;
with CASH_REGISTER;
package Fuel_Type_Selection_Task is
   task type fuel_Type_Selection_Task(Pri: system.Priority; unitID: Positive; fuelType: PUMP.FUEL_TYPES) is
      pragma Priority(Pri);
   end fuel_Type_Selection_Task;
end Fuel_Type_Selection_Task;
