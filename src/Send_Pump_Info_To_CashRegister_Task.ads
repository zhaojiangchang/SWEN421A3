pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with PUMP_UNIT; use PUMP_UNIT;
with PUMP;
with CASH_REGISTER;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
package Send_Pump_Info_To_CashRegister_Task is

   task type send_Pump_Info_To_CashRegister_Task(Pri: system.Priority; unitID: Positive) is
      pragma Priority(Pri);
   end send_Pump_Info_To_CashRegister_Task;
end Send_Pump_Info_To_CashRegister_Task;
