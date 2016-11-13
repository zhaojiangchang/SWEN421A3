pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with PUMP;
with CASH_REGISTER;
package Authorisation_Task is
   task type authorisation_Task(Pri: system.Priority; unitID: Positive) is
      pragma Priority(Pri);
   end authorisation_Task;
end Authorisation_Task;
