#include <stdio.h>
#include <string.h>


#define number 20

int main(){

	//read input file into array input 
    int input[number];
    int count = 0, i = 0;
    FILE *file;
    file = fopen("input.dat","r");
    if(!file){
        perror("Error opening input file");
        return -1;
    }

    memset(input, 0, sizeof(input));  // Initialization
    while (!feof(file)){              // Check for the end of file
        fscanf(file, "%d", &(input[count++]));
    }
    fclose(file);
	
	printf("sequence of input  data:");
    for(i = 0; i < count; i++){
        printf("%d", input[i]);
    }
    
    
    //read golden file into array golden
    int golden[number];
    count = 0, i = 0;
    FILE *file2;
    file2 = fopen("golden.dat","r");
    if(!file2){
        perror("Error opening input file");
        return -1;
    }

    memset(golden, 0, sizeof(golden));  // Initialization
    while (!feof(file2)){              // Check for the end of file
        fscanf(file2, "%d", &(golden[count++]));
    }
    fclose(file2);
	
	printf("\nsequence of golden data:");
    for(i = 0; i < count; i++){
        printf("%d", golden[i]);
    }
    
	
	//check 010111
	int test[count];
	memset(test, 0, sizeof(test));
	for(i = 5 ; i < 19 ; i++){
        if(input[i-5]==0&&input[i-4]==1&&input[i-3]==0&&input[i-2]==1&&input[i-1]==1&&input[i]==1){
            test[i] = 1;
        }
    }
    
	//check 1101
	for(i = 3 ; i < 19 ; i++){
        if(input[i-3]==1&&input[i-2]==1&&input[i-1]==0&&input[i]==1){
            test[i] = 1;
        }
    }
	
	printf("\nsequence of test   data:");
	for(i = 0; i < count; i++){
        printf("%d", test[i]);
    }
	
	//check error
	printf("\n");
	int error = 0;
	for(i = 0; i < count; i++){
        if(test[i] != golden[i]){
        	 error = 1;
        	 printf("\ninput= %d, output data is %d but golden is %d in index %d",input[i],test[i],golden[i],i);
		}
    }
    
    if(error)
    	printf("\nThere are some errors...");
    else
    	printf("\n\nSUCCESS!");
	
    return 0;
}
