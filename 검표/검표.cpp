/*
   1층 검표 : B1F 2관3관  1F 1관 3F 7관8관(커플관)
   4층 검표: 4F 4관5관9관 6F 6관
   전체 스케줄 입력 first,
   1층인지 4층검표인지 입력 -> 동선정리 **지원필요여부 명시필요

   n관 입장-퇴출
   */
#include<stdio.h>
#include<stdlib.h>
#include<algorithm>
#include<iostream>
#include<string>
using namespace std;
typedef struct node {
	int hall; //1~9
	string floor;
	//B1F : 2관 3관 /  
	int start_time_hour;
	int start_time_min;
	int end_time_hour;
	int end_time_min;
}node;

typedef node* Node;

int main() {
	Node arr[100]; //arr은 입력정보 순차적 저장.
	printf("Input hall no, start_time, end time.\n");
	printf("After all input, input 012345678 to finish input\n");
	pair<int, pair<int, pair<int, string>>> P[200]; // 시각 , 상영관, 입장이면 1 or 퇴장이면 0 , 층
	int i = 0;
	int j = 0;

	for (; ; i++, j++) {
		//Node temp = (Node)malloc(sizeof(node));
		Node temp = new node;
		
		if (temp == NULL) { 
			printf("Fatal Error : memory exceed\n");
			return 0;
		}

		scanf("%1d %2d %2d %2d %2d", &temp->hall, &temp->start_time_hour, &temp->start_time_min, &temp->end_time_hour, &temp->end_time_min);
		if (temp->hall == 0)	break;
		if (temp->hall == 2 ||temp->hall == 3) {
			temp->floor = "B1F";
		}
		else if (temp->hall == 1)
			temp->floor = "1F";
		else if (temp->hall == 7 || temp->hall == 8)
			temp->floor = "3F";
		else if (temp->hall == 4 || temp->hall == 5 || temp->hall == 9)
			temp->floor = "4F";
		else
			temp->floor = "6F";
			
 		if (temp->start_time_min - 10 < 0) {
			temp->start_time_min = temp->start_time_min - 10 + 60;  //60진법으로 시간에서 60분 빌려오기
			temp->start_time_hour -= 1; // 시간에서 빌려주므로 1시간 빼기
		}
		else 
			temp->start_time_min = temp->start_time_min - 10;
		P[j].first = temp->start_time_hour * 100 + temp->start_time_min;
		P[j].second.first = temp->hall;
		P[j].second.second.first = 1;
		P[j].second.second.second = temp->floor;
		j++;
		P[j].first = temp->end_time_hour * 100 + temp->end_time_min;
		P[j].second.first = temp->hall;
		P[j].second.second.first = 0;
		P[j].second.second.second = temp->floor;
		arr[i] = temp;
	}

	sort(P, P + j);
	for (int k = 0; k < j; k++) {
		if (P[k].second.second.first==1) {
			int hour= P[k].first / 100;
			int min = P[k].first % 100 + 20;
			if (min >= 60) {
				hour += 1;
				min -= 60;
			}
			printf("시각 : %02d : %02d ~ %02d : %02d     상영관 : %2d관\t입장\t%s\n", P[k].first / 100, P[k].first % 100, hour, min, P[k].second.first, P[k].second.second.second.c_str());
		}

		else if (P[k].second.second.first == 0)
			printf("시각 : %02d : %02d               상영관 : %2d관\t퇴출\t%s\n", P[k].first / 100, P[k].first % 100, P[k].second.first, P[k].second.second.second.c_str());
	}
	for (int k = 0; k < i; k++) {
		delete arr[i];
	}
}
//입장이면 시각을 t-10~t+10으로 걸기