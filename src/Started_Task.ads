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
package Started_Task is
   task type started_Task(Pri: system.Priority; unitID: Positive) is
      pragma Priority(Pri);
   end started_Task;
end Started_Task;
