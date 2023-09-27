# About
This is a fork of the ProbLink algorithm. ProbLink is a probabilistic AS relationship inference algorithm, which does inference based on key AS-interconnection features derived from stochastically informative signals. Learn more about ProbLink in the [NSDI paper](https://www.usenix.org/conference/nsdi19/presentation/jin).

The original project is available on Github at [YuchenJin/ProbLink](https://github.com/YuchenJin/ProbLink).

I am using docker on Ubuntu 18.04 to be able to run the code in an older version
of Python that it was written in.


## Quickstart

I assume you have this code already. If not, clone this repository.

__Install Python dependencies__

```sh
$ pip install --user -r requirements.txt
```

__Prepare BGP paths__

You can prepare BGP paths of your interest and save them to a file 'rib.txt'. The ASes on each BGP path should be delimited by '|' on each line, for example:  `AS1|AS2|AS3`.
    

__Download AS to Organization Mapping Dataset from CAIDA__

https://www.caida.org/data/as-organizations/

__Download PeeringDB Dataset from CAIDA__

Before March 2016: http://data.caida.org/datasets/peeringdb-v1/
    
After March 2016: http://data.caida.org/datasets/peeringdb/

__Parse downloaded BGP paths__
```sh
$ python bgp_path_parser.py <peeringdb file> 
# Output is written to 'sanitized_rib.txt'.
```

__Run AS-Rank algorithm to bootstrap ProbLink__
```sh
$ ./asrank.pl sanitized_rib.txt > asrank_result.txt
```

__Run ProbLink__ 
```sh
$ python problink.py -p <peeringdb file> -a <AS to organization mapping file>
```

## Output data format
\<provider-as\>|\<customer-as\>|-1 

\<peer-as\>|\<peer-as\>|0 

\<sibling-as\>|\<sibling-as\>|1
