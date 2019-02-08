int main(int argc, char const *argv[])
{
	int n=100;
	int s;
	for(int i=2; i<=n; i++)
	{
		if(i==2)
			s=1;
		else
		{
			int j=i/2;
			while(j>=2)
			{
				if(i%j==0)
				{
					s=1;
					break;
				}
				j--;
			}
			if(j==1)
				s=0;
		}
	}
	return 0;
}