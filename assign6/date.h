#ifndef DATE_H
#define DATE_H

typedef struct date{
    int day;
    int month;
    int year;
}DATE_T;

void init_date(DATE_T *date, int day, int month, int year);

void init_date_1 (DATE_T *date);

int date_equal (DATE_T date1, DATE_T date2);

int date_less_than (DATE_T date1, DATE_T date2);

void format_date (DATE_T date, char *str);

void next_day (DATE_T *date);



#endif