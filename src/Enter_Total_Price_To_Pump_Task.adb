with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Enter_Total_Price_To_Pump_Task is
   use all type PUMP.FUEL_TYPES;
   task body enter_Total_Price_To_Pump_Task is

   begin

      if total <=1 then
         print("amount to add must greater than 1");
      else
         if unitID = 1 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ENTERED_PRICE :=total;

         elsif unitID = 2 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ENTERED_PRICE :=total;

         end if;
      end if;

   end enter_Total_Price_To_Pump_Task;
end Enter_Total_Price_To_Pump_Task;
