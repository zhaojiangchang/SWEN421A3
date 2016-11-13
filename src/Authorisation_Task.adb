with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;

package body Authorisation_Task is
   use all type PUMP.FLOAT_NUMBER;

   task body authorisation_Task is

   begin

      if unitID = 1 then
         if CASH_REGISTER_OBJECT.cashRegister.UNIT_1.TO_PAY = 0.0 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_1.ActivePump:=True;
            print("Authorisation PUMP_UNIT_1");
         else
            print("Authorisation failed, PUMP_UNIT_1 inuse");

         end if;

      elsif unitID = 2 then
        if CASH_REGISTER_OBJECT.cashRegister.UNIT_2.TO_PAY = 0.0 then
            PUMP_UNIT_OBJECTS.PUMP_UNIT_2.ActivePump:=True;
            print("Authorisation PUMP_UNIT_1");
         else
            print("Authorisation failed, PUMP_UNIT_1 inuse");

         end if;
      end if;

   end authorisation_Task;
end Authorisation_Task;
