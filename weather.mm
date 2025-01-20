//
//  Untitled.mm
//  WeatherForecastHandling
//
//  Created by Ahmad Abdullah on 07/12/2024.
//
#import <Foundation/Foundation.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <format>
using namespace std;

@interface RequestForWeatherData : NSObject
- (void)FromURL:(NSString *)URL;
@end

@implementation RequestForWeatherData
- (void)FromURL:(NSString *)URL{
    NSURL *url = [NSURL URLWithString:URL];
    if (!url) {
        NSLog(@"URL is invalid or does not exist");
        return;
    }
    NSURLSession *session = [NSURLSession sharedSession];
        [[session dataTaskWithURL:url completionHandler:^(NSData *weatherdata, NSURLResponse *response, NSError *error) {
            if (error) {
                NSLog(@"Error fetching data: %@", error.localizedDescription);
                return;
            }

            if (weatherdata) {
                NSString *FileToWriteWeatherDataTo = @"/Users/aa/Desktop/WeatherForecastHandling/WeatherData.csv";
                BOOL success = [weatherdata writeToFile:FileToWriteWeatherDataTo atomically:YES];
                if (success) {
                    NSLog(@"Successfully fetched weather data");
                } else {
                    NSLog(@"Failed to retrieve weather data");
                }
            }
        }] resume]; // Start the task
    }
    @end
void CurrentWeather(void);
void DailyWeather(void);
int main(){
        float Latitude = 0.0,Longitude = 0.0;
        string Location;

            int Option1;
            char option2;

            do{
            cout<<"\t\t\t\t\t\t\t\tWelcome to WeatherForecasting Service \n\t\t\t\t\t\t\t\t  Your Personal Weather Companion!"<<endl;
            cout<<endl;

            cout<<"We have following Services for you:\n "<<endl;
            cout<<"Press 1: Current Weather "<<endl;
            cout<<"Press 2: Daily Weather "<<endl;
            cout<<"Choose(1-2): ";

            cin>>Option1;
            cout<<endl;


            cout<<"We have following locations:";
            cout<<"Islamabad"<<endl;
            cout<<"Rawalpindi"<<endl;
            cout<<"Lahore"<<endl;
            cout<<"Karachi"<<endl;
            cout<<"Multan"<<endl;
            cout<<"Faisalabad"<<endl;
            cout<<"Abbottabad"<<endl;
            cout<<"Peshawar"<<endl;
            cout<<"Quetta"<<endl;
            cout<<"Mardan"<<endl;
            cout<<"Gilgit"<<endl;
            cout<<"Hyderabad"<<endl;
            cout<<"Jhelum"<<endl;
            cout<<"Malakand"<<endl;
            cout<<"Sialkot"<<endl;

            cout<<"Enter Your Location: ";
            cin>>Location;
            cout<<endl;
            if(Location == "Islamabad"){
                Latitude = 33.6995;
                Longitude = 73.0363;
            }else if(Location == "Rawalpindi"){
                Latitude = 33.626057;
                Longitude = 73.071442;
            }else if(Location == "Lahore"){
                Latitude = 31.5204;
                Longitude = 74.3587;
            }else if(Location == "Karachi"){
                Latitude = 24.860966;
                Longitude = 66.990501;
            }else if(Location == "Multan"){
                Latitude = 30.1864;
                Longitude = 71.4886;
            }else if(Location == "Faisalabad"){
                Latitude = 31.4504;
                Longitude = 73.1350;
            }else if(Location == "Abbottabad"){
                Latitude = 34.1688;
                Longitude = 73.2215;
            }else if(Location == "Peshawar"){
                Latitude = 34.0151;
                Longitude = 71.5249;
            }else if(Location == "Quetta"){
                Latitude = 30.1834;
                Longitude = 66.9987;
            }else if(Location == "Mardan"){
                Latitude = 34.1986;
                Longitude = 72.0404;
            }else if(Location == "Gilgit"){
                Latitude = 35.9202;
                Longitude = 74.3080;
            }else if(Location == "Hyderabad"){
                Latitude = 17.4065;
                Longitude = 78.4772;
            }else if(Location == "Jhelum"){
                Latitude = 32.9425;
                Longitude = 73.7257;
            }else if(Location == "Malakand"){
                Latitude = 34.5030;
                Longitude = 71.9046;
            }else if(Location == "Sialkot"){
                Latitude = 32.4945;
                Longitude = 74.5229;
            }
            else{
                do {
                    cout<<"wrong input, please note that the location is to be typed as it is, and its case-sensitive"<<endl;
                    cin>>Location;
                } while (Location != "Islamabad" && Location != "Rawalpindi" && Location != "Lahore" && Location != "Karachi" &&
                         Location != "Multan" && Location != "Faisalabad" && Location != "Abbottabad" && Location != "Peshawar" &&
                         Location != "Quetta" && Location != "Mardan" && Location != "Gilgit" && Location != "Hyderabad" &&
                         Location != "Jhelum" && Location != "Malakand" && Location != "Sialkot");
            }

                
            switch (Option1)
            {
            case 1:
                    @autoreleasepool {
                        RequestForWeatherData *WeatherForUserLocation = [[RequestForWeatherData alloc] init];
                        NSString *APIUrl = [NSString stringWithFormat:@"https://api.open-meteo.com/v1/forecast?latitude=%.4f&longitude=%.4f&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m&format=csv", Latitude, Longitude];
                            
                        [WeatherForUserLocation FromURL:APIUrl];
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];
                    }
                CurrentWeather();
                break;

            case 2:
                    @autoreleasepool {
                        RequestForWeatherData *WeatherForUserLocation = [[RequestForWeatherData alloc] init];
                        NSString *APIUrl = [NSString stringWithFormat:@"https://api.open-meteo.com/v1/forecast?latitude=%.4f&longitude=%.4f&daily=temperature_2m_max,temperature_2m_min,sunrise,sunset,uv_index_max,precipitation_sum,wind_direction_10m_dominant&format=csv", Latitude, Longitude];
                            
                        [WeatherForUserLocation FromURL:APIUrl];
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
                    }
                DailyWeather();
                break;

            default:
               cout<<"Wrong Input!"<<endl;
                break;
            }

            cout<<"Would you like to use our service again? (Y/N): ";
            cin>>option2;
            cout<<endl;


         } while(option2=='Y'|| option2=='y');

         cout<<"Thank you for using the WeatherForecasting Service! Goodbye."<<endl;
        }
        

        void CurrentWeather( ){
            
            ifstream Readfile("/Users/aa/Desktop/WeatherForecastHandling/WeatherData.csv");

            if(!Readfile){
                cout<<"Error! File Cant Be Opened"<<endl;
                return;
            }

            string line,line4,line5;

            int LineNumber = 0;
            while(getline(Readfile, line)){
                LineNumber++;
                if(LineNumber == 4){
                    line4 = line;
                }else if(LineNumber == 5){
                    line5 = line;
                }
                if(LineNumber > 5){
                    break;
                }
            }
          
            Readfile.close();


            string SearchValue="temperature_2m (°C)";
            string variable, value;
            stringstream Line4(line4), Line5(line5);

            
            while(getline(Line4, variable, ',') && getline(Line5, value, ',')){
                if (variable == SearchValue){
                    cout<<"Current temperature: "<<value <<endl;
                }
            }


            string SearchValue2="relative_humidity_2m (%)";
            string variable2, value2;
            stringstream SLine4(line4), SLine5(line5);

            
            while(getline(SLine4, variable2, ',') && getline(SLine5, value2, ',')){
                if (variable2 == SearchValue2){
                    cout<<"Humidity per 2m in your city: "<<value2<<" %"<<endl;
                }
            }



            string SearchValue3="apparent_temperature (°C)";
            string variable3, value3;
            stringstream TLine4(line4), TLine5(line5);

            
            while(getline(TLine4, variable3, ',') && getline(TLine5, value3, ',')){
                if (variable3 == SearchValue3){
                    cout<<"Apparent temperature: "<<value3<<endl;
                }
            }


            string SearchValue4="is_day ()";
            string variable4, value4;
            stringstream FourthLine4(line4), FourthLine5(line5);

            
            while(getline(FourthLine4, variable4, ',') && getline(FourthLine5, value4, ',')){
                if (variable4 == SearchValue4){
                    if (value4=="1") {
                        cout<<"Day time"<<endl;
                    }
                    else{
                        cout<<"Night time"<<endl;
                    }
                }
            }


            string SearchValue5="precipitation (mm)";
            string variable5, value5;
            stringstream FifthLine4(line4), FifthLine5(line5);

            
            while(getline(FifthLine4, variable5, ',') && getline(FifthLine5, value5, ',')){
                if (variable5 == SearchValue5){
                    cout<<"Precipitation: "<<value5<<" mm"<<endl;
                }
            }



            string SearchValue6="surface_pressure (hPa)";
            string variable6, value6;
            stringstream SixthLine4(line4), SixthLine5(line5);

            
            while(getline(SixthLine4, variable6, ',') && getline(SixthLine5, value6, ',')){
                if (variable6 == SearchValue6){
                    cout<<"Surface pressure: "<<value6<<" hPa"<<endl;
                }
            }


            string SearchValue7="wind_speed_10m (km/h)";
            string variable7, value7;
            stringstream SeventhLine4(line4), SeventhLine5(line5);

            
            while(getline(SeventhLine4, variable7, ',') && getline(SeventhLine5, value7, ',')){
                if (variable7 == SearchValue7){
                    cout<<"Wind speed per 10m in your city: "<<value5<<" km/h"<<endl;
                }
            }



            string SearchValue8="wind_direction_10m (°)";
            string variable8, value8;
            stringstream EighthLine4(line4), EighthLine5(line5);

            
            while(getline(EighthLine4, variable8, ',') && getline(EighthLine5, value8, ',')){
                if (variable8 == SearchValue8){
                    cout<<"Wind direction per 10m in your city: "<<value8<<" °"<<endl;
                }
            }

            }

         void DailyWeather(){

            ifstream Readfile("/Users/aa/Desktop/WeatherForecastHandling/WeatherData.csv");

            if(!Readfile){
                cout<<"Error! File Cant Be Opened"<<endl;
            }

            string line,line4,line5;

            int LineNumber = 0;
            while(getline(Readfile, line)){
                LineNumber++;
                if(LineNumber == 4){
                    line4 = line;
                }else if(LineNumber == 5){
                    line5 = line;
                }
                if(LineNumber > 5){
                    break;
                }
            }
          
            Readfile.close();



            string SearchValue="temperature_2m_max (°C)";
            string variable, value;
            stringstream Line4(line4), Line5(line5);

            
            while(getline(Line4, variable, ',') && getline(Line5, value, ',')){
                if (variable == SearchValue){
                    cout<<"Maximum temperature in your city till currently was/is: "<<value <<endl;
                }
            }



            string SearchValue2="temperature_2m_min (°C)";
            string variable2, value2;
            stringstream SLine4(line4), SLine5(line5);

            
            while(getline(SLine4, variable2, ',') && getline(SLine5, value2, ',')){
                if (variable2 == SearchValue2){
                    cout<<"Minimum temperature in your city till currently was/is: "<<value2 <<endl;
                }
            }


            string SearchValue3="sunrise (iso8601)";
            string variable3, value3;
            stringstream TLine4(line4), TLine5(line5);

            
            while(getline(TLine4, variable3, ',') && getline(TLine5, value3, ',')){
                if (variable3 == SearchValue3){
                    cout<<"Sunrise at: "<<value3 <<endl;
                }
            }


            string SearchValue4="sunset (iso8601)";
            string variable4, value4;
            stringstream FourthLine4(line4), FourthLine5(line5);

            
            while(getline(FourthLine4, variable4, ',') && getline(FourthLine5, value4, ',')){
                if (variable4 == SearchValue4){
                    cout<<"Sunset at: "<<value4 <<endl;
                }
            }


            string SearchValue5="uv_index_max ()";
            string variable5, value5;
            stringstream FifthLine4(line4), FifthLine5(line5);

            
            while(getline(FifthLine4, variable5, ',') && getline(FifthLine5, value5, ',')){
                if (variable5 == SearchValue5){
                    cout<<"UV index today: "<<value5 <<endl;
                }
            }


            string SearchValue6="precipitation_sum (mm)";
            string variable6, value6;
            stringstream SixthLine4(line4), SixthLine5(line5);

            
            while(getline(SixthLine4, variable6, ',') && getline(SixthLine5, value6, ',')){
                if (variable6 == SearchValue6){
                    cout<<"Accumulated precipitation in your area: "<<value6<<" mm" <<endl;
                }
            }



            string SearchValue7="wind_direction_10m_dominant (°)";
            string variable7, value7;
            stringstream SeventhLine4(line4), SeventhLine5(line5);

            
            while(getline(SeventhLine4, variable7, ',') && getline(SeventhLine5, value7, ',')){
                if (variable7 == SearchValue7){
                    cout<<"Dominant wind direction in your city today: "<<value7<<" degrees"<<endl;
                }
            }

    
 }


