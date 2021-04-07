/* 1층 검표 : B1F 2관3관  1F 1관 3F 7관8관(커플관)
   4층 검표: 4F 4관5관9관 6F 6관
   전체 스케줄 입력 first, 
   1층인지 4층검표인지 입력 -> 동선정리 **지원필요여부 명시필요

   n관 입장-퇴출 
   */
#include<stdio.h>
#include<algorithm>
typedef struct node{
	int hall;
	int start_time;
	int end_time;
}node;
int main() {
	node* arr[100];
	for (int i = 0; i < 100; i++) {
		scanf("%d %d %d", arr[i]->hall, arr[i]->start_time, arr[i]->end_time);
	}
}