pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with PUMP;
with CASH_REGISTER;
with CAR_OBJECT;
with PUMP_UNIT;
package Stat_Pump_Task is
   task type stat_Pump_Task(Pri: system.Priority; unitID: Positive) is
      pragma Priority(Pri);
   end stat_Pump_Task;
end Stat_Pump_Task;
