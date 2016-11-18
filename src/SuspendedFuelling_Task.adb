with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;

package body SuspendedFuelling_Task is
   use all type PUMP.FLOAT_NUMBER;
   use all type PUMP_UNIT.PUMP_UNIT_STATES;
   task body suspendedFuelling_Task is
   begin
      if unitID = 1 then

         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE = PUMP_UNIT.Fuelling then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE := PUMP_UNIT.SuspendedFuelling;
            if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_1" then
               print_fuel_type("Car 1 SuspendedFuelling: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE );
               PUMP_UNIT.STOP_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP);
            elsif CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION = "UNIT_1" then
               PUMP_UNIT.STOP_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP);
               --PUMP_UNIT.RETURN_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP);
               print_fuel_type("Car 2 SuspendedFuelling: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE );
            end if;
         end if;

      elsif unitID = 2 then
       if PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE = PUMP_UNIT.Fuelling then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE := PUMP_UNIT.SuspendedFuelling;
            if CAR_OBJECT.CAR_1.PUMP_UNIT_LOCATION = "UNIT_2" then
               print_fuel_type("Car 1 SuspendedFuelling: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE );
               PUMP_UNIT.STOP_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP);
            elsif CAR_OBJECT.CAR_2.PUMP_UNIT_LOCATION = "UNIT_2" then
               PUMP_UNIT.STOP_PUMPING(PUMP_UNIT_OBJECTS.PUMP_UNIT_2,PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP);
               --PUMP_UNIT.RETURN_NOZZLE(PUMP_UNIT_OBJECTS.PUMP_UNIT_1,PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP);
               print_fuel_type("Car 2 SuspendedFuelling: ",PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE );
            end if;
         end if;

      end if;

   end suspendedFuelling_Task;
end SuspendedFuelling_Task;
