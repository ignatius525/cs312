#include <date.h>
#include <time.h>


void init_date(DATE_T *date, int day, int month, int year)
{
    date.day = day;
    date.month = month;
    date.year = year;
}
void init_date_1 (DATE_T *date)
{
    char date_str [20];
    time_t curr_time = time (NULL);
    struct tm local_date = *localtime (&curr_time);
     
    // set date_str to current date in standard format
    sprintf (date_str, "%d/%d/%d", local_date.tm_mon, local_date.tm_mday, local_date.tm_year);

    date.day = 
    //printf ("date: %s\n", date_str);
    //printf ("\nNote: the month and year may need to be modified\n");

}

int date_equal (DATE_T date1, DATE_T date2)
{


}
int date_less_than (DATE_T date1, DATE_T date2)
{


}

static char *month_str (int month)
{


}
void format_date (DATE_T date, char *str)
{


}
static int leap_year (int year)
{


}
static int month_length (int month, int leap)
{


}
void next_day (DATE_T *date)
{


}