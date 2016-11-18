pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with PUMP_UNIT;
package Operating_State_Task is
   task type operating_State_Task(Pri: system.Priority) is
      pragma Priority(Pri);
   end operating_State_Task;
end Operating_State_Task;
