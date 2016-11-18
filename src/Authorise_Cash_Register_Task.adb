with sPrint; use sPrint;
with Ada.Text_IO; use Ada.Text_IO;
with Epoch;

package body Authorise_Cash_Register_Task is
   use all type PUMP.FLOAT_NUMBER;
   use all type PUMP_UNIT.PUMP_UNIT_STATES;
   task body authorise_Cash_Register_Task is
      Period : constant Ada.Real_Time.Time_Span :=
        Ada.Real_Time.Microseconds(100);

      Next_Period : Ada.Real_Time.Time;

      Start_Epoch : Ada.Real_Time.Time := Epoch.PEpoch.Start_Time;
   begin
      Next_Period := Start_Epoch + Period;
      while CASH_REGISTER_OBJECT.cashRegister.IS_SETUP = False
      loop
         delay until Next_Period;
         Next_Period:=Next_Period+Period;
      end loop;

      CASH_REGISTER_OBJECT.cashRegister.STATE := PUMP_UNIT.Authorised;
      CASH_REGISTER_OBJECT.cashRegister.ActiveCashRegister := True;

      print("==============================================");
      print(" Cash Register Authorisated - Operating state");
      print("==============================================");
   end authorise_Cash_Register_Task;
end Authorise_Cash_Register_Task;
