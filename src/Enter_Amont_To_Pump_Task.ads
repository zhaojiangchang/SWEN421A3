pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CASH_REGISTER_OBJECT;
with PUMP;
with CASH_REGISTER;
package Enter_Amont_To_Pump_Task is
   task type enter_Amont_To_Pump_Task(Pri: system.Priority; unitID: Positive; total: Positive) is
      pragma Priority(Pri);
   end enter_Amont_To_Pump_Task;
end Enter_Amont_To_Pump_Task;
