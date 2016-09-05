typedef struct {
	int an_int;
	int another;
	char a_char;
	int i1;
	int i2;
	int i3;
	double dd;
	double doo;
	double dos;
} myStruct;



myStruct function(myStruct strct){
	strct.an_int = 0;
	return strct;
}


int main(){
	myStruct chelo = {
		1,2,3,5,6,7,8,9,10
	};

	chelo = function(chelo);

	if(!chelo.an_int){
		return 0;
	}
	return 1;

}