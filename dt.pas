program dt;

uses sysutils;

type
    day_range = 1..31;
    month_range = 1..12;
    date_t = record
        day : day_range;
        month : month_range;
        year : integer;
    end;


procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
    begin
        dt.day := day;
        dt.month := month;
        dt.year := year;
    end;

procedure init_date1 (var dt : date_t);
    Var 
        YY,MM,DD : Word;
    begin
        DecodeDate(Date,YY,MM,DD);
        dt.day := DD;
        dt.month := MM;
        dt.year := YY;
    end;
    
function date_equal (date1 : date_t; date2 : date_t) : boolean;
    Var
        ret : boolean;
    begin
        if((date1.month = date2.month) and (date1.day = date2.day) and (date1.year = date2.year)) then
            ret := True
        else
            ret := False;
        date_equal := ret; 
    end;


function date_less_than (date1 : date_t; date2: date_t) : boolean;
    Var
        ret : boolean;
    begin
        ret := False;
        if(date1.year < date2.year) then
            ret := True;
        if((date1.year = date2.year) and (date1.month < date2.month)) then
            ret := True;
        if((date1.year = date2.year) and (date1.month = date2.month) and (date1.day < date2.day)) then
            ret := True;
        date_less_than := ret;
    end;

function month_str (month : month_range) : string;
    Var 
        ret : string;
    begin
        if(month = 1) then
            ret := 'January';
        if(month = 2) then
            ret := 'February';
        if(month = 3) then
            ret := 'March';
        if(month = 4) then
            ret := 'April';
        if(month = 5) then
            ret := 'May';
        if(month = 6) then
            ret := 'June';
        if(month = 7) then
            ret := 'July';
        if(month = 8) then
            ret := 'August';
        if(month = 9) then
            ret := 'September';
        if(month = 10) then
            ret := 'October';
        if(month = 11) then
            ret := 'November';
        if(month = 12) then
            ret := 'December';
        month_str := ret;
        
    end;

procedure format_date (dt : date_t; var ret_str : string);
    Var
        day_temp, month_temp, year_temp : String;
    begin
        str(dt.day, day_temp);
        str(dt.year, year_temp);
        month_temp := month_str(dt.month);
        ret_str := month_temp + ' ' + day_temp + ', ' + year_temp;

    end;

procedure next_day (var dt : date_t);
    Var
        is_leap : boolean;
    function leap_year (year : integer) : boolean;
        Var
            retur : boolean;
        begin
            if (year mod 4 = 0) then
                begin
                    retur := True;
                    if ((year mod 100 = 0) and (year mod 400 <> 0)) then
                        retur := False;
                end
            else
                retur := False;
            leap_year := retur;
        end;

    function month_length (month : month_range; leap : boolean) : day_range;
        Var
            ret : day_range;
        begin
            if ((month = 1) or (month = 3) or (month = 5) or (month = 7) or (month = 8) or (month = 10) or (month = 12)) then
                ret := 31;
            if ((month = 4) or (month = 6) or (month = 9) or (month = 11)) then
                ret := 30;
            if ((month = 2) and (leap)) then
                ret := 29;
            if ((month = 2) and (True<>leap)) then
                ret := 28;
            month_length := ret;
        end;
    begin
        is_leap := leap_year(dt.year);

        if(dt.day = month_length(dt.month, is_leap)) then
            begin
                if dt.month = 12 then 
                    begin
                        dt.day := 1;
                        dt.month := 1;
                        dt.year := dt.year + 1;
                    end
                else
                    begin
                        dt.day := 1;
                        dt.month := dt.month + 1;
                    end;
                end
        else
            dt.day := dt.day + 1;
    end;

Var
    d1, d2, d3 : date_t;
    format_str : string;

begin
    
    init_date1(d1);
    init_date(d2, 30, 12, 1999);
    init_date(d3, 1, 1, 2000);
    
    format_date(d1, format_str);
    writeln('d1: ' + format_str);
    format_date(d2, format_str);
    writeln('d2: ' + format_str);
    format_date(d3, format_str);
    writeln('d3: ' + format_str);
    writeln('');
    
    writeln('d1 < d2? ', date_less_than(d1,d2));
    writeln('d2 < d3? ', date_less_than(d2,d3));
    writeln('');
    
    next_day(d2);
    format_date(d2, format_str);
    writeln('next day d2: ', format_str);
    writeln('d2 < d3? ', date_less_than(d2,d3));
    writeln('d2 = d3? ', date_equal(d2,d3));
    writeln('d2 > d3? ', date_less_than(d3,d2));
    writeln('');
    
    next_day(d2);
    format_date(d2, format_str);
    writeln('next day d2: ', format_str);
    writeln('d2 = d3? ', date_equal(d2,d3));
    writeln('');
    
    init_date(d1, 28, 2, 1529);
    format_date(d1, format_str);
    writeln('Initialized d1 to ', format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ', format_str);
    writeln('');
    
    init_date(d1, 28, 2, 1460);
    format_date(d1, format_str);
    writeln('Initialized d1 to ', format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ', format_str);
    writeln('');
    
    init_date(d1, 28, 2, 1700);
    format_date(d1, format_str);
    writeln('Initialized d1 to ', format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ', format_str);
    writeln('');
    
    init_date(d1, 28, 2, 1600);
    format_date(d1, format_str);
    writeln('Initialized d1 to ', format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ', format_str);
    writeln('');

end.