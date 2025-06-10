//A higher-order function is a function that does at least one of the following:
//Takes another function as a parameter
//Returns a function

//RETURN function
Function multiply(int x){
    return (int z) => x * z;
}

void main(){
    var num  = multiply(5); 
    print(num(10)); 
}