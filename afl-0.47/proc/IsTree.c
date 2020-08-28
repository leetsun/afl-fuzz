#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


//const int MAXN = 10000;
#define MAXN 10000

int father[MAXN];
int height[MAXN];
int inDegree[MAXN];
bool visit[MAXN];

void Initial()
{
    for(int i = 0; i < MAXN; i++)
    {
        father[i] = i;
        height[i] = 0;
        inDegree[i] = 0;
        visit[i] = false;
    }
}

int Find(int x)
{
    if(x != father[x]) // not root
    {
        father[x] = Find(father[x]);
    }
    return father[x];
}

void Union(int x, int y)
{
    x = Find(x);    // get x's root
    y = Find(y);

    if(x != y)
    {
        if(height[x] < height[y])   // x -> y
        {
            father[x] = y;
        }else if(height[x] > height[y])
        {
            father[y] = x;
        }else{
            father[y] = x;
            height[x]++;
        }
    }
}

bool IsTree()
{
    int component = 0;
    int root = 0;   // node which inderee is 0.
    for(int i = 1; i < MAXN; i++)
    {
        if(visit[i]){
            if(father[i] == i)  // find a component
            {
                component++;
            }
            if(inDegree[i] == 0)
            {
                root++;
            }else if(inDegree[i] > 1)
            {
                return false;   // not a tree
            }
        }
    }
    if(component == 1 && root == 1)
    {
        return true;
    }
    if(component ==0 && root == 0)  // empty set
    {
        return true;
    }
    return false;
}

int main()
{
    int first, second;
    int tc = 1;
    FILE *fc;
    if((fc = fopen("./tc.txt", "rw")) == NULL){
    //if((fc = fopen("./proc/tc.txt", "rw")) == NULL){
        printf("Failed open tc.txt\n");
        return 1;
    }
    Initial();
    while(1)
    {
        fscanf(fc, "%d %d", &first, &second);

        if(first < 0 || second < 0)
        {
            break;
        }
        if(first == 0 && second == 0)
        {
            if(IsTree())
            {
                printf("case %d is a tree.\n", tc++);
            }else
            {
                printf("case %d isnot a tree.\n", tc++);
            }
            Initial();
        }else
        {
            visit[first] = true;
            visit[second] = true;
            inDegree[second]++;
            Union(first, second);
        }
    }
    fclose(fc);
    return 0;
}