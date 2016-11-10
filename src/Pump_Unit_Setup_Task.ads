pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with PUMP_UNIT;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
package Pump_Unit_Setup_Task is
   task type pump_Unit_Setup_Task(Pri: system.Priority) is
      pragma Priority(Pri);
   end pump_Unit_Setup_Task;
end Pump_Unit_Setup_Task;
