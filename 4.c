int main()
{
	int n=55;
	char s;
	if(n==2)
		s='p';
	else if(n%2==0)
		s='e';
	else
	{
		int j=n/2;
		int t=0;
		while(j>=2)
		{
			if(n%j==0)
			{
				t=1;
				break;
			}
			j--;
		}
		if(t==1)
			s='p';
		else
			s='o';
	}
	switch(s)
	{
		case 'o':
		{
			int t=0;
			int k=n+1;
			while(t!=1)
			{
				int j=k/2;
				while(j>=2)
				{
					if(n%j==0)
					{
						t=1;
						break;
					}
					j--;
				}
			}
			n=k;
		}
		case 'e': n++; break;
		case 'p': n++; break;
	}
}