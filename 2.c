int main(int argc, char const *argv[])
{
	int a[6]={1,9,-4,6,9,3};
	int value1 = 6;
	int b[6]={9,99,999,4,55,621};
	int value2 = 33;
	for(int i=0; i<6; i++)
	{
		a[i]+=value1;
		b[i]+=value2;
	}
	return 0;
}