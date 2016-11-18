with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;
with PUMP_UNIT;
package body Enter_Amont_To_Pump_Task is
   use all type PUMP.FUEL_TYPES;
   use all type PUMP.FLOAT_NUMBER;
   task body enter_Amont_To_Pump_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;

      amountToFill: PUMP.FLOAT_NUMBER;
   begin
      amountToFill:= PUMP.FLOAT_NUMBER(total);
      print("============================================");
      if unitID = 1 then
         Next_Period := Start_Epoch + Period;

         while PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_PUMP_SELECTED = False
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         if  PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_PUMP_SELECTED = True
         then

            if amountToFill <=0.0 then
               print("amount to add must greater than 0");
            else
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.Display.ENTERED_AMOUNT :=amountToFill;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.IS_AMOUNT_ENTERD:=True;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_1.STATE:=PUMP_UNIT.Started;
               print_float_type("PUMP UNIT 1 - Amount to fill($/Liter): ", amountToFill);
            end if;
         end if;


      elsif unitID = 2 then
         Next_Period := Start_Epoch + Period;

         while PUMP_UNIT_OBJECTS.PUMP_UNIT_2.IS_PUMP_SELECTED = False
         loop
            delay until Next_Period;
            Next_Period:=Next_Period+Period;
         end loop;
         if amountToFill <=0.0 then
            print("amount to add must greater than 0");
         else
            if unitID = 2 then
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.Display.ENTERED_AMOUNT :=amountToFill;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.IS_AMOUNT_ENTERD:=True;
               PUMP_UNIT_OBJECTS.PUMP_UNIT_2.STATE:=PUMP_UNIT.Started;
               print_float_type("PUMP UNIT 2 - Amount to fill($/Liter): ", amountToFill);

            end if;
         end if;
         print("");

      end if;

      print("============================================");

   end enter_Amont_To_Pump_Task;
end Enter_Amont_To_Pump_Task;
