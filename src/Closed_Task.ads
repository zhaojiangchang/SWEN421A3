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
package Closed_Task is
   task type closed_Task(Pri: system.Priority; ClosingTime: Positive) is
      pragma Priority(Pri);
   end closed_Task;
end Closed_Task;
