
pageextension 50200 CustomerCard extends "Customer Card"
{

    trigger OnOpenPage()
    begin
        InvalidDate := 19000101D;
        InvalidDateErrorMessage := Text001;
        AssertError CheckDate(InvalidDate);

        lasterror := GetLastErrorText();

        IF GetLastErrorText <> InvalidDateErrorMessage then
            Error('Unexpected error: %1', GetLastErrorText);

        if not customer.get('CUST00001') then begin
            customer.Init();
            customer."No." := 'CUST00001';
            customer.Name := 'Akshay';
            customer.Insert();
        end;

    end;

    procedure CheckDate(date: Date)
    begin
        if date < WorkDate() then
            Error(Text001);
    end;


    var
        InvalidDate: Date;
        InvalidDateErrorMessage: Text;
        Text001: Label 'The date is outside the valid date range.';
        lasterror: Text;
        customer: Record Customer;
}