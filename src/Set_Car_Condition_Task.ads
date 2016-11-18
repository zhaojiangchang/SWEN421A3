pragma Profile(Ravenscar);
pragma Partition_Elaboration_Policy (Sequential);
with System;
with PUMP_UNIT;
with Ada.Real_Time;  use Ada.Real_Time;
with PUMP_UNIT_OBJECTS;
with CAR_OBJECT;
with CASH_REGISTER_OBJECT;
with CASH_REGISTER;
package Set_Car_Condition_Task  is
   task type set_Car_Condition_Task (Pri: system.Priority; car:CAR_OBJECT.Cars; location: PUMP_UNIT_OBJECTS.PUMP_UNITS; tankSize: Positive) is
      pragma Priority(Pri);
   end set_Car_Condition_Task ;
end Set_Car_Condition_Task ;
