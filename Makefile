CC=gcc

# uncomment for Mac OS X or don't want to use SSE2/SSE3 instructions
#CFLAGS=-DNO_SSE

all: build_jtt build_lg build_wag

build_jtt:
	$(CC) $(CFLAGS) -O3 -finline-functions -funroll-loops -Wall -o FastTree_JTT FastTree_JTT.c -lm

build_lg:
	$(CC) $(CFLAGS) -O3 -finline-functions -funroll-loops -Wall -o FastTree_LG FastTree_LG.c -lm

build_wag:
	$(CC) $(CFLAGS) -O3 -finline-functions -funroll-loops -Wall -o FastTree_WAG FastTree_WAG.c -lm

test: test_jtt test_lg test_wag

test_jtt:
	./FastTree_JTT -gamma -log fasttree_jtt.log -nosupport msa_sample.aga-gb > fasttree_jtt.newick

test_lg:
	./FastTree_LG -gamma -log fasttree_lg.log -nosupport msa_sample.aga-gb > fasttree_lg.newick

test_wag:
	./FastTree_WAG -gamma -log fasttree_wag.log -nosupport msa_sample.aga-gb > fasttree_wag.newick

clean:
	rm FastTree_JTT FastTree_LG FastTree_WAG	
