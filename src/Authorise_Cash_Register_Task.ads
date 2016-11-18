pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with PUMP_UNIT;
with CASH_REGISTER_OBJECT;
with PUMP;
with CASH_REGISTER;
package Authorise_Cash_Register_Task is
   task type authorise_Cash_Register_Task(Pri: system.Priority) is
      pragma Priority(Pri);
   end authorise_Cash_Register_Task;
end Authorise_Cash_Register_Task;
