pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with PUMP;
with CASH_REGISTER;
package Enter_Total_Price_To_Pump_Task is
   task type enter_Total_Price_To_Pump_Task(Pri: system.Priority; unitID: Positive; total: Positive) is
      pragma Priority(Pri);
   end enter_Total_Price_To_Pump_Task;
end Enter_Total_Price_To_Pump_Task;
