with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Stat_Pump_Task is
   use all type PUMP.FLOAT_NUMBER;

   task body stat_Pump_Task is
   begin
      if unitID = 1 then
         if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_1" then
            PUMP_UNIT.LEFT_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE);
            PUMP_UNIT.START_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ENTERED_AMOUNT, CAR_OBJECT.CAR_1.TANK_SIZE);
            PUMP_UNIT.RETURN_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP);

         end if;

      elsif unitID = 2 then
       null;
      end if;

   end stat_Pump_Task;
end Stat_Pump_Task;
