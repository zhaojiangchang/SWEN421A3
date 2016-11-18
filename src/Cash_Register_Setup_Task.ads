pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with PUMP_UNIT;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with CASH_REGISTER;
package Cash_Register_Setup_Task  is
   task type cash_Register_Setup_Task (Pri: system.Priority) is
      pragma Priority(Pri);
   end cash_Register_Setup_Task ;
end Cash_Register_Setup_Task ;
