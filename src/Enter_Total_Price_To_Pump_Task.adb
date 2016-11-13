with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Enter_Total_Price_To_Pump_Task is
   use all type PUMP.FUEL_TYPES;
   task body enter_Total_Price_To_Pump_Task is

   begin

      if fuelType /=PUMP.U91 or fuelType /= PUMP.U95 or fuelType /= PUMP.Diesel then
         print("asign U91, U95 or Diesel only");
      else
         if unitID = 1 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE :=fuelType;

            if fuelType = PUMP.U91 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_91;
            elsif fuelType = PUMP.U95 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_95;
            elsif fuelType = PUMP.Diesel then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_Diesel;
            end if;

         elsif unitID = 2 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE :=fuelType;

            if fuelType = PUMP.U91 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_91;
            elsif fuelType = PUMP.U95 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_95;
            elsif fuelType = PUMP.Diesel then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_Diesel;
            end if;
         end if;
      end if;

   end enter_Total_Price_To_Pump_Task;
end Enter_Total_Price_To_Pump_Task;
