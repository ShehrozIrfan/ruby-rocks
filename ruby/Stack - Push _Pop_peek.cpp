#include <stdio.h>
#include <stdlib.h>


/*
A stack is a linear data structure which uses the same principle, i.e., the elements in a stack are
added and removed only from one end, which is called the TOP.
Hence, a stack is called a LIFO (Last-In-First-Out) data
structure, as the element that was inserted last is the first one to
be taken out. Whenever a function calls another function, the calling function is pushed onto the
top of the stack. 
In order to keep track of the returning point of each active function,
a special stack called system stack or call stack is used. Whenever a
function calls another function, the calling function is pushed onto the
top of the stack. This is because after the called function gets executed,
the control is passed back to the calling function . Stacks can be implemented using either arrays or linked lists.

operation on stack
A stack supports three basic operations: push, pop, and peek. The push operation adds an element
to the top of the stack and the pop operation removes the element from the top of the stack. The
peek operation returns the value of the topmost element of the stack.


*/
struct Stack{
	int size;
	int top; //store the address of the topmost element of the stack.
	int *S;
};

void create(struct Stack *st){
	printf("Enter Size");
	scanf("%d",&st->size);
	st->top=-1;
	st->S=(int *)malloc(st->size*sizeof(int));
	}
	
void Display(struct Stack st){
	int i;
	for(i=st.top;i>=0;i--)
		printf("%d ",st.S[i]);
	printf("\n");
}

void push(struct Stack *st,int x){
	if(st->top==st->size-1)
	printf("Stack overflow\n");
	else{
		st->top++;
		st->S[st->top]=x;
}

}

int pop(struct Stack *st){
	int x=-1;
	if(st->top==-1)
	printf("Stack Underflow\n");
	else{
		x=st->S[st->top--];
		}
		return x;
}
int peek(struct Stack st,int index)
{
int x=-1;
if(st.top-index+1<0)
printf("Invalid Index \n");
x=st.S[st.top-index+1];
return x;
}

int isEmpty(struct Stack st){
	if(st.top==-1)
	return 1;
	return 0;
}

int isFull(struct Stack st){
	return st.top==st.size-1;
}

int stackTop(struct Stack st){
	if(!isEmpty(st))
		return st.S[st.top];
return -1;
}

int main()
{
struct Stack st;
create(&st);
push(&st,10);
push(&st,20);
push(&st,30);
push(&st,40);
printf("%d \n",peek(st,2));

Display(st);
return 0;
}
