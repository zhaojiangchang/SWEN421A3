with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Enter_Amont_To_Pump_Task is
   use all type PUMP.FUEL_TYPES;
   use all type PUMP.FLOAT_NUMBER;
   task body enter_Amont_To_Pump_Task is
      amountToFill: PUMP.FLOAT_NUMBER;
   begin
      amountToFill:= PUMP.FLOAT_NUMBER(total);
      if amountToFill <=0.0 then
         print("amount to add must greater than 0");
      else
         if unitID = 1 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ENTERED_AMOUNT :=amountToFill;

         elsif unitID = 2 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ENTERED_AMOUNT :=amountToFill;

         end if;
      end if;

   end enter_Amont_To_Pump_Task;
end Enter_Amont_To_Pump_Task;
