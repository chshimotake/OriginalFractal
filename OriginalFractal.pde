float siz=500;
boolean invert = true, rec=false, lin=true;
public void setup()
{
	size(1000,1000);
}
public void draw()
{
	sierpinski(500,500,250);
}
public void mousePressed()
{
	if(invert)
	{
		siz/=2;
		fill(0,0,255);
		rect(0,0,width,height);
	}else if(invert==false)
	{
		if(siz<500)
		{
			siz*=2;
		}
		fill(0,0,255);
		rect(0,0,width,height);
	}
}
public void sierpinski(float x, float y, float len) 
{
	if(rec)
	{
		if(len<=siz)
		{
			fill(255,0,0);
			rect(x,y,len,len);
		}
		if(len>siz)
		{	
			fill(255,0,0);
			rect(x,y,len,len);
			sierpinski(x-len/4,y-len/4,len/2);
			sierpinski(x+len/2+len/4,y-len/4,len/2);
			sierpinski(x-len/4,y+len/2+len/4,len/2);
			sierpinski(x+len/2+len/4 ,y+len/2+len/4,len/2);
		}
	}
	if(lin)
	{
		if(len<=siz)
		{
			stroke(255,0,0);
			strokeWeight(1);
			line(x-len,y-len,x+len,y+len);
			line(x-len,y+len,x+len,y-len);
		}
		if(len>siz)
		{
			stroke(255,0,0);
			strokeWeight(1);
			line(x-len,y-len,x+len,y+len);
			line(x-len,y+len,x+len,y-len);
			sierpinski(x-len/2,y-len/2,len/2);
			sierpinski(x+len/2,y+len/2,len/2);
			sierpinski(x-len/2,y+len/2,len/2);
			sierpinski(x+len/2,y-len/2,len/2);
		}
	}
}
public void keyPressed()
{
	switch(key)
	{
		case ' ':
			invert=!invert;
		break;
		case 'l':
			lin=true;
		break;
	}
}