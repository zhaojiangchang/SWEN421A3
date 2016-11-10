pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with PUMP_UNIT; use PUMP_UNIT;
with PUMP;
with CASH_REGISTER;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
package Pay_Task is

   task type pay_Task(Pri: system.Priority; unitID: Positive; AMOUNT: Positive) is
      pragma Priority(Pri);
   end pay_Task;
end Pay_Task;
