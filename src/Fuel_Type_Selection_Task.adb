with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;

package body Fuel_Type_Selection_Task is
   use all type PUMP.FUEL_TYPES;
   use all type PUMP_UNIT.PUMP_UNIT_STATES;
   task body fuel_Type_Selection_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

   begin

      if unitID = 1 then

         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_1.ActivePumpUnit = False
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         print("============================================");
         if PUMP_UNIT_OBJECTS.PUMP_UNIT_1.ActivePumpUnit = True then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.FUEL_TYPE :=fuelType;
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE:=PUMP_UNIT.Calling;

            if fuelType = PUMP.U91 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_91;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_PUMP_SELECTED:=True;
               print("Fuel type Selected from PUMP UNIT 1: U91");

            elsif fuelType = PUMP.U95 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_95;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_PUMP_SELECTED:=True;
               print("Fuel type Selected from PUMP UNIT 1: U95");
            elsif fuelType = PUMP.Diesel then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_1.PUMP_Diesel;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_PUMP_SELECTED:=True;
               print("Fuel type Selected from PUMP UNIT 1: Diesel");
            end if;
         end if;
      elsif unitID = 2 then

         Next_Period := Start_Epoch + Period;
         while PUMP_UNIT_OBJECTS.PUMP_UNIT_2.ActivePumpUnit = False
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;

         if PUMP_UNIT_OBJECTS.PUMP_UNIT_2.ActivePumpUnit = True then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.FUEL_TYPE :=fuelType;
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE:=PUMP_UNIT.Calling;
            if fuelType = PUMP.U91 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_91;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.IS_PUMP_SELECTED:=True;
               print("Fuel type Selected from PUMP UNIT 2: U91");

            elsif fuelType = PUMP.U95 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_95;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.IS_PUMP_SELECTED:=True;
               print("Fuel type Selected from PUMP UNIT 2: U95");
            elsif fuelType = PUMP.Diesel then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ACTIVED_PUMP :=PUMP_UNIT_OBJECTS.PUMP_UNIT_2.PUMP_Diesel;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.IS_PUMP_SELECTED:=True;
               print("Fuel type Selected from PUMP UNIT 2: Diesel");
            end if;
         end if;
      end if;
      print("============================================");
   end fuel_Type_Selection_Task;
end Fuel_Type_Selection_Task;
