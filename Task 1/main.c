//
//  main.c
//  Deviation
//
//  Created by Sebastian Janus on 08.02.14.
//  Copyright (c) 2014 Sebastian Janus. All rights reserved.
//
#include <stdio.h>

void find_deviation(int *v, int v_length, int d) {
    int i;
    
    
    int dev = 0;
    int value;
    
    int min;
    int max;

    
    
    int j=0;
    max = 0;
    min = 2147483647; //2^31-1
    
    if(d==0) {
        
    }
    else if(d==v_length) {
        
        int z=0;
        for(z=0; z<d; z++)
        {
            if(v[z]>max){
                max=v[z];
            }
            if(v[z]<min){
                min=v[z];
            }
        }
        dev=(max-min);
    }
    else {
        
        
        
        for(i=0; i<=v_length;i++) {
            
            if(j<=d-1) {
                
                j++;
                value=v[i];
                
                if(value < min) {
                    min=value;
                                    }
                if (value > max){
                    max=value;
                    
                }
            }
            else if(j==d){
                i=i-(d-2);
                j=0;
                
                if(dev<(max-min)){
                    dev=(max-min);

                }
                min=2147483647;
                max=0;
            }
        }
    }
    
    printf("%d \n", dev);
}

int main(int argc, const char * argv[])
{
    int v[]={6, 9, 4, 7, 4, 1};
    int v_length=sizeof(v)/sizeof(v[0]);
    int d=3;
    
    find_deviation(v, v_length,d);
    
    return 0;
}